require "spec_helper"
require "plays/straight"

describe Plays::Straight do
  describe ".from" do
    it "finds possible straights" do
      expect(inspect_play(Plays::Straight, "3S 2D 6H 4C 5H")).to eq([
        %w(3S 2D 6H 4C 5H)
      ])
      expect(inspect_play(Plays::Straight, "JD TH AS QD AC")).to eq([])
      expect(inspect_play(Plays::Straight, "AD 2D 3D 4H 5H")).to eq([])
    end
  end
end
