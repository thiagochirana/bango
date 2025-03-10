# frozen_string_literal: true

require_relative "countries/brazil"

module TellIo
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
    raise CountryError("Country is empty! Please, tell me what's the country") if country.nil?

    Object.const_get("TellIo::Countries::#{country.to_s.capitalize}")
  end
end
