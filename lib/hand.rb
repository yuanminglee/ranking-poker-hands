class Hand
  include Comparable

  attr_reader :cards

  def initialize(cards, factory)
    @cards = cards
    @play = factory.new(@cards).max
  end

  def <=>(other_hand)
    play <=> other_hand.play
  end

  protected

  attr_reader :play
end
