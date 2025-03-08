# frozen_string_literal: true

require_relative "bango/version"

module Bango
  class Error < StandardError; end

  class TelephoneError < StandardError
    def initialize
      super(%(Telephone is wrong! It is a telephone number?))
    end
  end

  class FormatError < StardardError
    def initialize
      super(%(Telephone has a wrong format!))
    end
  end
end
