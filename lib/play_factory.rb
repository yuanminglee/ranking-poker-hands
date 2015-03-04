require "scored_play"
require "play_with_side_cards"

class PlayFactory
  def initialize(factories)
    @factories = factories
  end

  def new(cards)
    @factories.each_with_index.flat_map do |factory, score|
      factory.from(cards).map do |play|
        ScoredPlay.new(score, PlayWithSideCards.new(play, cards))
      end
    end
  end
end
