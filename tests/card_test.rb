require "minitest/autorun"
require_relative "../card.rb"

class CardTest < Minitest::Test
    describe Card do
        before do
            @card = Card.new("2", "\u2663", 2)
        end

        describe "when @rank is accessed" do
            it "is a String" do
                assert_equal(String, @card.rank.class)
            end
        end

        describe "when @value is accessed" do
            it "is an integer" do
                assert_equal(Integer, @card.value.class)
            end
        end

        describe "#show_card" do
            it "combines rank and suit into a String" do
                assert_equal("2\u2663", @card.show_card)
            end
        end

        describe "#compare_card" do
            describe "when second card is of a higher rank" do
                it "is greater than first card" do
                    @card1 = Card.new("3", "\u2663", 3)
                    @card2 = Card.new("4", "\u2663", 4)

                    assert_equal(true, @card2 > @card1)
                    assert_equal(false, @card2 < @card1)
                    assert_equal(false, @card2 == @card1)

                end
            end

            describe "when second card is the same rank" do
                it "is equal to first card" do
                    @card1 = Card.new("J", "\u2663", 11)
                    @card2 = Card.new("J", "\u2663", 11)

                    assert_equal(true, @card2 == @card1)
                    assert_equal(false, @card2 < @card1)
                    assert_equal(false, @card2 > @card1)
                end
            end

            describe "when second card is of a lower rank" do
                it "is less than first card" do
                    @card1 = Card.new("A", "\u2663", 14)
                    @card2 = Card.new("K", "\u2663", 13)

                    assert_equal(true, @card2 < @card1)
                    assert_equal(false, @card2 > @card1)
                    assert_equal(false, @card2 == @card1)
                end
            end
        end
    end
end