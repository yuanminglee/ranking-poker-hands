require "plays/straight"
require "plays/flush"
require "plays/group"

module Plays
  class StraightFlush
    def self.from(cards)
      matches = cards_matching(Straight, cards) & cards_matching(Flush, cards)
      if cards == matches
        [Group.new(cards)]
      else
        []
      end
    end

    private

    def self.cards_matching(play_factory, cards)
      play = play_factory.from(cards).first
      if play
        play.cards
      else
        []
      end
    end
  end
end
