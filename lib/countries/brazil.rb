# frozen_string_literal: true

require_relative "country"

module TellIo
  module Countries
    class Brazil < Country
      DDD = %w[
        11 12 13 14 15 16 17 18 19
        21 22 24 27 28
        31 32 33 34 35 37 38
        41 42 43 44 45 46 47 48 49
        51 53 54 55
        61 62 63 64 65 66 67 68 69
        71 73 74 75 77 79
        81 82 83 84 85 86 87 88 89
        91 92 93 94 95 96 97 98 99
      ].freeze

      def self.valid?(phone)
        normalized = normalize(phone)
        return false unless normalized.match?(/\A\+55\d{10,11}\z/)

        ddd = normalized[3..4]
        DDD.include?(ddd)
      end

      def self.format(phone)
        normalized = normalize(phone)
        normalized.gsub(/\A\+55(\d{2})(\d{4,5})(\d{4})\z/, "(\\1) \\2-\\3")
      end

      def self.generate
        ddd = DDD.sample
        number = rand(7000..9999)
        "+55#{ddd}9#{rand(1000..9999)}#{number}"
      end

      def self.normalize(phone)
        phone = phone.gsub(/[^0-9+]/, "")
        phone = phone.sub(/\A0/, "")
        "+55#{phone.gsub(/\A\+55/, "")}"
      end
    end
  end
end
