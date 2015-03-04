class ScoredPlay
  include Comparable

  def initialize(score, play)
    @score = score
    @play = play
  end

  def cards
    @play.cards
  end

  def <=>(other)
    [score, play] <=> [other.score, other.play]
  end

  protected

  attr_reader :score, :play
end
