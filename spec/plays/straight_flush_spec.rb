require "spec_helper"
require "plays/straight_flush"

describe Plays::StraightFlush do
  describe ".from" do
    it "finds possible flushes" do
      expect(inspect_play(Plays::StraightFlush, "2C 3C 4C 5C 6C")).to eq([
        %w(2C 3C 4C 5C 6C)
      ])
      expect(inspect_play(Plays::StraightFlush, "2C 3C 4C 5C 7C")).to eq([])
      expect(inspect_play(Plays::StraightFlush, "2C 3C 4C 5C 6D")).to eq([])
    end
  end
end
