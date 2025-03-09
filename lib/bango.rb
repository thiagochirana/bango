# frozen_string_literal: true

require_relative "countries/brazil"

module Bango
  def self.valid_phone?(phone:, country:)
    country_class = get_country_class(country)
    country_class.valid?(phone)
  rescue NameError
    raise ArgumentError, "Country not supported"
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
    Object.const_get("Bango::Countries::#{country.to_s.capitalize}")
  end

  module_function :valid_phone?, :format_phone, :generate_phone
end
