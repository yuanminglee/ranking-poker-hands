require "spec_helper"
require "card"

describe Card do
  describe ".parse" do
    context "with a valid card string" do
      it "parses face cards" do
        expect(Card.parse("AS").rank).to eq(Card::ACE)
        expect(Card.parse("KS").rank).to eq(Card::KING)
        expect(Card.parse("QS").rank).to eq(Card::QUEEN)
        expect(Card.parse("JS").rank).to eq(Card::JACK)
      end

      it "parses numeric cards" do
        (2..9).each do |rank|
          expect(Card.parse("#{rank}S").rank).to eq(rank)
        end

        expect(Card.parse("TS").rank).to eq(10)
      end

      it "parses suits" do
        expect(Card.parse("AC").suit).to eq(Card::CLUBS)
        expect(Card.parse("AD").suit).to eq(Card::DIAMONDS)
        expect(Card.parse("AH").suit).to eq(Card::HEARTS)
        expect(Card.parse("AS").suit).to eq(Card::SPADES)
      end
    end

    context "with an invalid card string" do
      it "raises an error" do
        expect { Card.parse("AX") }.to raise_error(Card::ParseError)
        expect { Card.parse("XC") }.to raise_error(Card::ParseError)
      end
    end
  end

  describe "#to_s" do
    it "maps its rank and suit back to strings" do
      %w(AS KD QH JC TS 9S 8D 7H 6D 5D 4D 3D 2D).each do |string|
        expect(Card.parse(string).to_s).to eq(string)
      end
    end
  end

  describe "#inspect" do
    it "uses to_s" do
      %w(AS KD QH JC TS 9S 8D 7H 6D 5D 4D 3D 2D).each do |string|
        expect(Card.parse(string).inspect).to eq("#<Card #{string}>")
      end
    end
  end

  describe "#==" do
    context "with the same rank and suit" do
      it "is true" do
        expect(Card.parse("AS")).to eq(Card.parse("AS"))
      end
    end

    context "with a different rank" do
      it "is false" do
        expect(Card.parse("AS")).not_to eq(Card.parse("KS"))
      end
    end

    context "with a different suit" do
      it "is false" do
        expect(Card.parse("AS")).not_to eq(Card.parse("AD"))
      end
    end

    context "without a card" do
      it "is false" do
        expect(Card.parse("AS")).not_to eq("AS")
      end
    end
  end

  describe "#<=>" do
    it "compares by rank" do
      expect(Card.parse("AS")).to be > Card.parse("KS")
      expect(Card.parse("KS")).to be > Card.parse("QS")
      expect(Card.parse("QS")).to be > Card.parse("JS")
      expect(Card.parse("JS")).to be > Card.parse("TS")
      expect(Card.parse("TS")).to be > Card.parse("9S")
      expect(Card.parse("9S")).to be > Card.parse("8S")
      expect(Card.parse("8S")).to be > Card.parse("7S")
      expect(Card.parse("7S")).to be > Card.parse("6S")
      expect(Card.parse("6S")).to be > Card.parse("5S")
      expect(Card.parse("5S")).to be > Card.parse("4S")
      expect(Card.parse("4S")).to be > Card.parse("3S")
      expect(Card.parse("3S")).to be > Card.parse("2S")
    end
  end

  describe "#succ" do
    context "below an ace" do
      it "returns the next highest rank" do
        expect(Card.parse("2C").succ).to eq(Card.parse("3C"))
        expect(Card.parse("3D").succ).to eq(Card.parse("4D"))
        expect(Card.parse("4H").succ).to eq(Card.parse("5H"))
        expect(Card.parse("5S").succ).to eq(Card.parse("6S"))
        expect(Card.parse("6C").succ).to eq(Card.parse("7C"))
        expect(Card.parse("7D").succ).to eq(Card.parse("8D"))
        expect(Card.parse("8H").succ).to eq(Card.parse("9H"))
        expect(Card.parse("9S").succ).to eq(Card.parse("TS"))
        expect(Card.parse("TC").succ).to eq(Card.parse("JC"))
        expect(Card.parse("JD").succ).to eq(Card.parse("QD"))
        expect(Card.parse("QH").succ).to eq(Card.parse("KH"))
        expect(Card.parse("KS").succ).to eq(Card.parse("AS"))
      end
    end

    context "with an ace" do
      it "returns nil" do
        expect(Card.parse("AS").succ).to be_nil
      end
    end
  end
end
