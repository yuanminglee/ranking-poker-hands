require "spec_helper"
require "play_with_side_cards"

describe PlayWithSideCards do
  describe "#cards" do
    it "delegates to its play" do
      cards = double("cards")
      play = double("play", cards: cards)
      play_with_side_cards = PlayWithSideCards.new(play, double("side-cards"))

      result = play_with_side_cards.cards

      expect(result).to eq(cards)
    end
  end

  describe "#<=>" do
    it "sorts by play and side cards" do
      expect(PlayWithSideCards.new(stub_play(2, "3S"), cards("2D"))).
        to be > PlayWithSideCards.new(stub_play(1, "2S"), cards("4S"))
      expect(PlayWithSideCards.new(stub_play(1, "2D 2H"), cards("2D 2H 3D 4D 6D"))).
        to be > PlayWithSideCards.new(stub_play(1, "2C 2S"), cards("2C 2S 3S 4S 5S"))
    end
  end

  def stub_play(score, card_string)
    double("play<#{score}, #{card_string}>").tap do |play|
      allow(play).to receive(:cards).and_return(cards(card_string))
      allow(play).to receive(:score).and_return(score)
      allow(play).to receive(:<=>) { |other| score <=> other.score }
    end
  end
end
