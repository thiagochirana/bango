# frozen_string_literal: true

require "spec_helper"

RSpec.describe TellIo::Countries::Brazil do
  describe ".valid?" do
    it "returns true for valid Brazilian numbers" do
      expect(described_class.valid?("+55 11 999990123")).to be true
      expect(described_class.valid?("11999990123")).to be true
      expect(described_class.valid?("011 99999-0123")).to be true
    end

    it "returns false for invalid Brazilian numbers" do
      expect(described_class.valid?("999990123")).to be false
      expect(described_class.valid?("123456")).to be false
    end
  end

  describe ".format" do
    it "formats valid Brazilian numbers correctly" do
      expect(described_class.format("+55 11 999990123")).to eq("(11) 99999-0123")
      expect(described_class.format("11999990123")).to eq("(11) 99999-0123")
    end
  end

  describe ".generate" do
    it "generates a valid Brazilian number" do
      phone = described_class.generate
      expect(described_class.valid?(phone)).to be true
    end
  end
end
