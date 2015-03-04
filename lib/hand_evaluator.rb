require "card"
require "hand"
require "play_factory"
require "plays/flop"
require "plays/two_pair"
require "plays/straight"
require "plays/flush"
require "plays/full_house"
require "plays/run"
require "plays/straight_flush"

class HandEvaluator
  include Plays

  def initialize
    @play_factory = PlayFactory.new(
      [
        Flop,
        Run.new(2),
        TwoPair,
        Run.new(3),
        Straight,
        Flush,
        FullHouse,
        Run.new(4),
        StraightFlush
      ]
    )
  end

  def return_stronger_hand(left, right)
    [parse(left), parse(right)].max.cards.map(&:to_s)
  end

  private

  def parse(card_strings)
    cards = card_strings.map { |card_string| Card.parse(card_string) }
    Hand.new(cards, @play_factory)
  end
end
