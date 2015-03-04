require "spec_helper"
require "plays/full_house"

describe Plays::FullHouse do
  describe ".from" do
    it "finds possible full houses" do
      expect(inspect_play(Plays::FullHouse, "2D 3D 3H 2H 3C")).to eq([
        %w(3D 3H 3C 2D 2H)
      ])
      expect(inspect_play(Plays::FullHouse, "2D 2H 3D 3H 4D")).to eq([])
    end
  end

  describe "#<=>" do
    it "orders by rank" do
      expect(Plays::FullHouse.from(cards("2D 2C 4D 4C 4H")).first).
        to be > Plays::FullHouse.from(cards("2H 2S 3D 3C 3H")).first
      expect(Plays::FullHouse.from(cards("2D 2C 2D 4C 4H")).first).
        to be > Plays::FullHouse.from(cards("2H 2S 2D 3C 3H")).first
    end
  end
end
