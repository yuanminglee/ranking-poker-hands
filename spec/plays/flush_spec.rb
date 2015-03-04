require "spec_helper"
require "plays/flush"

describe Plays::Flush do
  describe ".from" do
    it "finds possible flushes" do
      expect(inspect_play(Plays::Flush, "2C 3C 4C 5C 7C")).to eq([
        %w(2C 3C 4C 5C 7C)
      ])
      expect(inspect_play(Plays::Flush, "2D 3D 4D 5D 7D")).to eq([
        %w(2D 3D 4D 5D 7D)
      ])
      expect(inspect_play(Plays::Flush, "2H 3H 4H 5H 7H")).to eq([
        %w(2H 3H 4H 5H 7H)
      ])
      expect(inspect_play(Plays::Flush, "2S 3S 4S 5S 7S")).to eq([
        %w(2S 3S 4S 5S 7S)
      ])
      expect(inspect_play(Plays::Flush, "2D 3D 4D 5D 7H")).to eq([])
    end
  end
end
