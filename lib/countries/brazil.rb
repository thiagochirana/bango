# frozen_string_literal: true

require_relative "country"

module DialTool
  module Countries
    class Brazil < Country
      def self.valid?(phone)
        normalized = normalize(phone)
        !!(normalized =~ /\A\+55\d{10,11}\z/)
      end

      def self.format(phone)
        normalized = normalize(phone)
        normalized.gsub(/\A\+55(\d{2})(\d{4,5})(\d{4})\z/, "(\\1) \\2-\\3")
      end

      def self.generate
        ddd = rand(10..99)
        number = rand(6000..9999) # Garantindo que seja um número realista
        "+55#{ddd}9#{rand(1000..9999)}#{number}"
      end

      def self.normalize(phone)
        phone = phone.gsub(/[^0-9]/, "") # Remove tudo que não for número
        phone = phone.sub(/\A0/, "") # Remove zero inicial, se houver
        phone = "+55#{phone}" if [10, 11].include?(phone.length) # Adiciona +55 se necessário
        phone
      end
    end
  end
end
