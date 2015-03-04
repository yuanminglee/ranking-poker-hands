module Plays
  class FullHouse
    include Comparable

    def self.from(cards)
      groups = cards.group_by(&:rank).values.sort_by(&:length).reverse
      if groups.map(&:length) == [3, 2]
        [new(*groups)]
      else
        []
      end
    end

    def initialize(three_of_a_kind, pair)
      @three_of_a_kind = three_of_a_kind
      @pair = pair
    end

    def cards
      three_of_a_kind + pair
    end

    def <=>(other)
      [three_of_a_kind, pair] <=> [other.three_of_a_kind, other.pair]
    end

    protected

    attr_reader :three_of_a_kind, :pair
  end
end
