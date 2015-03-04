require "spec_helper"
require "plays/run"

describe Plays::Run do
  describe "#from" do
    it "finds possible groups of the given size" do
      expect(inspect_play(Plays::Run.new(4), "2D 2S 2H 2C 4H")).to eq([
        %w(2D 2S 2H 2C)
      ])
      expect(inspect_play(Plays::Run.new(4), "2D 2S 3H 2C 4H")).to eq([
      ])
      expect(inspect_play(Plays::Run.new(3), "2D 2S 2H 3H 4H")).to eq([
        %w(2D 2S 2H)
      ])
      expect(inspect_play(Plays::Run.new(3), "2D 2S 5H 5D 4H")).to eq([
      ])
      expect(inspect_play(Plays::Run.new(2), "2D 2S 4H 3H 4D")).to eq([
        %w(2D 2S),
        %w(4H 4D)
      ])
      expect(inspect_play(Plays::Run.new(2), "2D 5S 4H 3H 7D")).to eq([
      ])
    end
  end
end
