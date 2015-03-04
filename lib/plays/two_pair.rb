require "plays/run"

module Plays
  class TwoPair
    include Comparable

    def self.from(cards)
      from_pairs Run.new(2).from(cards).map(&:cards)
    end

    attr_reader :cards

    def initialize(cards)
      @cards = cards
    end

    def <=>(other)
      [cards.max, cards.min] <=> [other.cards.max, other.cards.min]
    end

    private

    def self.from_pairs(pairs)
      case pairs
      when []
        []
      else
        head, *tail = pairs
        tail.
          reject { |test| (head & test).any? }.
          map { |pair| new(head + pair) } +
          from_pairs(tail)
      end
    end
  end
end
