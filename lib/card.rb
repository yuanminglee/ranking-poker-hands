class Card
  include Comparable

  ACE = 'Ace'.freeze
  KING = 'King'.freeze
  QUEEN = 'Queen'.freeze
  JACK = 'Jack'.freeze

  CLUBS = 'Clubs'.freeze
  DIAMONDS = 'Diamonds'.freeze
  HEARTS = 'Hearts'.freeze
  SPADES = 'Spades'.freeze

  RANKS = {
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    'J': JACK,
    'Q': QUEEN,
    'K': KING,
    'A': ACE
  }.freeze

  SUITS = {
    'C': CLUBS,
    'D': DIAMONDS,
    'H': HEARTS,
    'S': SPADES
  }.freeze

  class ParseError < StandardError
  end

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    [RANKS.invert[@rank], SUITS.invert[@suit]].join
  end

  def inspect
    "#<Card #{to_s}>"
  end

  def ==(other)
    other.is_a?(Card) && rank == other.rank && suit = other.suit
  end

  def <=>(other)
    score <=> other.score
  end

  def succ
    next_rank = RANK.values[score + 1]
    if next_rank
      self.class.new next_rank, suit
    end
  end

  protected

  def score
    RANK.values.index(rank)
  end
end
