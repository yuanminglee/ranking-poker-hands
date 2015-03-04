require "spec_helper"
require "plays/group"

describe Plays::Group do
  describe "#<=>" do
    it "orders by rank" do
      expect(Plays::Group.new(cards("2D 2S 2D"))).
        to be < Plays::Group.new(cards("3D 3S 3D"))
      expect(Plays::Group.new(cards("6D 5D 3D"))).
        to be > Plays::Group.new(cards("6H 5H 2H"))
    end
  end
end
