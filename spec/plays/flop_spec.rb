require "spec_helper"
require "plays/flop"

describe Plays::Flop do
  describe ".from" do
    it "returns a single flop" do
      result = Plays::Flop.from(double("anything"))

      expect(result.size).to eq(1)
      expect(result.first).to be_a(Plays::Flop)
    end
  end

  describe "#cards" do
    it "has no cards" do
      expect(Plays::Flop.new.cards).to eq([])
    end
  end

  describe "#<=>" do
    it "sorts consistently" do
      left = Plays::Flop.new
      right = Plays::Flop.new

      expect(left).to eq(right)
    end
  end
end
