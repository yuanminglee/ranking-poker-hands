class PlayWithSideCards
  include Comparable

  def initialize(play, cards)
    @play = play
    @cards = cards
  end

  def cards
    @play.cards
  end

  def <=>(other)
    [play, side_cards] <=> [other.play, other.side_cards]
  end

  protected

  attr_reader :play

  def side_cards
    [@cards - play.cards].sort
  end
end
