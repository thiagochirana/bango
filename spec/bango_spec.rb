# frozen_string_literal: true

require "spec_helper"

RSpec.describe Bango do
  describe ".valid_phone?" do
    it "returns true for valid Brazilian numbers" do
      expect(Bango.valid_phone?(phone: "+55 11 999990123", country: :brazil)).to be true
      expect(Bango.valid_phone?(phone: "11999990123", country: :brazil)).to be true
      expect(Bango.valid_phone?(phone: "011 99999-0123", country: :brazil)).to be true
    end

    it "returns false for invalid Brazilian numbers" do
      expect(Bango.valid_phone?(phone: "999990123", country: :brazil)).to be false
      expect(Bango.valid_phone?(phone: "123456", country: :brazil)).to be false
    end

    it "raises an error for unsupported countries" do
      expect { Bango.valid_phone?(phone: "+1 123 456 7890", country: :unknown) }.to raise_error(ArgumentError)
    end
  end
end
