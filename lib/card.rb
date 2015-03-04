class Card
  include Comparable

  ACE = "Ace".freeze
  KING = "King".freeze
  QUEEN = "Queen".freeze
  JACK = "Jack".freeze

  CLUBS = "Clubs".freeze
  DIAMONDS = "Diamonds".freeze
  HEARTS = "Hearts".freeze
  SPADES = "Spades".freeze

  RANKS = {
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "T" => 10,
    "J" => JACK,
    "Q" => QUEEN,
    "K" => KING,
    "A" => ACE
  }

  SUITS = {
    "C" => CLUBS,
    "D" => DIAMONDS,
    "H" => HEARTS,
    "S" => SPADES
  }

  class ParseError < StandardError
  end

  def self.parse(string)
    rank_string, suit_string = *string.chars
    new(RANKS.fetch(rank_string), SUITS.fetch(suit_string))
  rescue KeyError
    raise ParseError, "Invalid card string: #{string.inspect}"
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
    other.is_a?(Card) && rank == other.rank && suit == other.suit
  end

  def <=>(other)
    score <=> other.score
  end

  def succ
    next_rank = RANKS.values[score + 1]
    if next_rank
      self.class.new next_rank, suit
    end
  end

  protected

  def score
    RANKS.values.index(rank)
  end
end
