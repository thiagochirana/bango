# frozen_string_literal: true

require_relative "countries/brazil"

module DialTool
  class CountryError < StandardError
    def initialize
      super(%(Country not supported))
    end
  end

  def self.valid_phone?(phone:, country:)
    country_class = get_country_class(country)
    country_class.valid?(phone)
  rescue NameError
    raise CountryError
  end

  def self.format_phone(phone:, country:)
    country_class = get_country_class(country)
    country_class.format(phone)
  end

  def self.generate_phone(country:)
    country_class = get_country_class(country)
    country_class.generate
  end

  def self.get_country_class(country)
    Object.const_get("DialTool::Countries::#{country.to_s.capitalize}")
  end

  #  module_function :valid_phone?, :format_phone, :generate_phone
end
