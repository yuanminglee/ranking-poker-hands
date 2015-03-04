module Plays
  class Flop
    include Comparable

    def self.from(_cards)
      [new]
    end

    def cards
      []
    end

    def <=>(other)
      0
    end
  end
end
