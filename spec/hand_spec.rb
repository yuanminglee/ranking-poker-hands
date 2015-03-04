require "spec_helper"
require "hand"

describe Hand do
  describe "#<=>" do
    it "compares hands by play" do
      higher_cards = cards("2S 2D 3S 4S 5S")
      lower_cards = cards("AS QS JD TS 9S")
      play_factory = double("play_factory")
      allow(play_factory).to receive(:new).with(higher_cards).and_return([1, 3])
      allow(play_factory).to receive(:new).with(lower_cards).and_return([2])
      higher_hand = Hand.new(higher_cards, play_factory)
      lower_hand = Hand.new(lower_cards, play_factory)

      expect(higher_hand).to be > lower_hand
      expect(lower_hand).to be < higher_hand
    end
  end

  describe "#cards" do
    it "returns its cards" do
      expect(hand("2S 3S 4S 5S 6S").cards).to eq(cards("2S 3S 4S 5S 6S"))
    end
  end

  def hand(string, play_factory: nil)
    hand_cards = cards(string)
    Hand.new(hand_cards, play_factory || stub_play_factory(hand_cards))
  end

  def stub_play_factory(cards)
    plays = [1, 2, 3]
    double("play_factory").tap do |play_factory|
      allow(play_factory).to receive(:new).with(cards).and_return(plays)
    end
  end
end
