# frozen_string_literal: true

require_relative "base"

module Bango
  module Countries
    class Brazil < Country
      def self.valid?(phone)
        !!(phone =~ /\A\+55\d{10,11}\z/)
      end

      def self.format(phone)
        phone.gsub(/\A\+55(\d{2})(\d{4,5})(\d{4})\z/, "(\\1) \\2-\\3")
      end

      def self.generate
        "+55#{rand(10..99)}9#{rand(1000..9999)}#{rand(1000..9999)}"
      end
    end
  end
end
