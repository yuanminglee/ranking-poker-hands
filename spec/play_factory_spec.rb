require "spec_helper"
require "play_factory"

describe PlayFactory do
  describe "#new" do
    it "combines instances from its factories" do
      allow(ScoredPlay).to receive(:new) { |score, play| [score, play] }
      allow(PlayWithSideCards).to receive(:new) { |play, cards| [play, cards] }
      factories = [
        stub_factory(returning: %w(one)),
        stub_factory(returning: %w(two three)),
        stub_factory(returning: [])
      ]
      factory = PlayFactory.new(factories)

      result = factory.new(cards)

      expect(result).to eq([
        [0, ["one", cards]],
        [1, ["two", cards]],
        [1, ["three", cards]]
      ])
    end
  end

  def stub_factory(returning:)
    double("factory").tap do |factory|
      allow(factory).to receive(:from).with(cards).and_return(returning)
    end
  end

  let(:cards) { double("cards") }
end
