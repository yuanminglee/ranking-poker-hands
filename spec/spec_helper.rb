require "rspec"

PROJECT_ROOT = File.expand_path('../..', __FILE__)

$LOAD_PATH << File.join(PROJECT_ROOT, 'lib', '*.rb')

module Helpers
  def cards(string)
    require "card"
    string.split(" ").map { |card_string| Card.parse(card_string) }
  end

  def inspect_play(factory, string)
    factory.from(cards(string)).map do |play|
      play.cards.map(&:to_s)
    end
  end
end

RSpec.configure do |config|
  config.include Helpers
end
