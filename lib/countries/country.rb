# frozen_string_literal: true

module DialTool
  module Countries
    class Country
      def self.valid?(phone)
        raise NotImplementedError, "Each country must implement the `valid?` method"
      end

      def self.format(phone)
        raise NotImplementedError, "Each country must implement the `format` method"
      end

      def self.generate
        raise NotImplementedError, "Each country must implement the `generate` method"
      end
    end
  end
end
