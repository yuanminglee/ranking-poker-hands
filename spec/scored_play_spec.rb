require "spec_helper"
require "scored_play"

describe ScoredPlay do
  describe "#cards" do
    it "delegates to its play" do
      cards = double("cards")
      play = double("play", cards: cards)
      scored_play = ScoredPlay.new(0, play)

      result = scored_play.cards

      expect(result).to eq(cards)
    end
  end

  describe "#<=>" do
    it "sorts by score and play" do
      expect(ScoredPlay.new(2, 1)).to be > ScoredPlay.new(1, 2)
      expect(ScoredPlay.new(1, 2)).to be > ScoredPlay.new(1, 1)
    end
  end
end
