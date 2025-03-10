# frozen_string_literal: true

require_relative "country"
module Bango
  module Countries
    class Unitedstates < Country
      def self.valid?(phone)
        !!(phone =~ /\A\+1\d{10}\z/)
      end

      def self.format(phone)
        phone.gsub(/\A\+1(\d{3})(\d{3})(\d{4})\z/, "(\\1) \\2-\\3")
      end

      def self.generate
        "+1#{rand(200..999)}#{rand(100..999)}#{rand(1000..9999)}"
      end
    end
  end
end
