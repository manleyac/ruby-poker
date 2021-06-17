require "minitest/autorun"
require_relative "../deck.rb"
require_relative "../card.rb"

class DeckTest < Minitest::Test

    describe Deck do
        before do
            @deck = Deck.new
        end

        describe "#initialized" do
            it "creates instances of Card" do
                @deck.cards.all? { |card| assert_instance_of(Card, card)}
            end

            it "creates 52 Cards" do
                assert_equal(52, @deck.cards.size)
            end
        end

        describe "#deal_hand" do
            it "returns an array of Card objects" do
                @deck.cards.all? { |card| assert_instance_of(Card, card)}
            end

            it "returns five Cards" do
                assert_equal(5, @deck.deal_hand.size)
            end
        end
    end
end