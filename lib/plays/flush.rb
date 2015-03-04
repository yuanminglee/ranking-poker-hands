require "plays/group"

module Plays
  class Flush
    include Comparable

    def self.from(cards)
      if cards.map(&:suit).uniq.size == 1
        [Group.new(cards)]
      else
        []
      end
    end
  end
end
