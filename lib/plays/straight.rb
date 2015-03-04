require "plays/group"

module Plays
  class Straight
    def self.from(cards)
      if in_sequence?(cards)
        [Group.new(cards)]
      else
        []
      end
    end

    private

    def self.in_sequence?(cards)
      sequence_start = cards.min

      cards.sort.inject(sequence_start) do |expected, actual|
        if expected.nil? || expected.rank != actual.rank
          return false
        end

        expected.succ
      end

      true
    end
  end
end
