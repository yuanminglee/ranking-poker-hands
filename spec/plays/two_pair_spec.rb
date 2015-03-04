require "spec_helper"
require "plays/two_pair"

describe Plays::TwoPair do
  describe ".from" do
    it "finds possible pairs" do
      expect(inspect_play(Plays::TwoPair, "2D 2S 4H 3D 3H")).to eq([
        %w(2D 2S 3D 3H)
      ])
      expect(inspect_play(Plays::TwoPair, "2D 2S 2H 3D 4H")).to eq([])
    end
  end

  describe "#<=>" do
    it "orders by rank" do
      expect(Plays::TwoPair.new(cards("4D 4S 2D 2S"))).
        to be < Plays::TwoPair.new(cards("3D 3S 5D 5S"))
      expect(Plays::TwoPair.new(cards("3D 3S 5D 5S"))).
        to be > Plays::TwoPair.new(cards("4D 4S 2D 2S"))
      expect(Plays::TwoPair.new(cards("4D 4S 3D 3S"))).
        to be > Plays::TwoPair.new(cards("4C 4H 2D 2S"))
    end
  end
end
