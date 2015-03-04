require "plays/group"

module Plays
  class Run
    def initialize(size)
      @size = size
    end

    def from(cards)
      cards.
        group_by(&:rank).
        values.
        select { |group| group.size == @size }.
        map { |group| Group.new(group) }
    end
  end
end
