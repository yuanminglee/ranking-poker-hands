module Plays
  class Group
    include Comparable

    attr_reader :cards

    def initialize(cards)
      @cards = cards
    end

    def <=>(other)
      [cards.sort] <=> [other.cards.sort]
    end
  end
end

