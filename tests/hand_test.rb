require "minitest/autorun"
require_relative "../deck.rb"
require_relative "../card.rb"
require_relative "../hand.rb"

class HandTest < Minitest::Test

    describe Hand do
        before do
            @deck = Deck.new
            @hand = Hand.new
        end

        describe "#take_cards" do
            it "accepts an array of Cards" do
                @hand.take_cards(@deck.deal_hand)

                @hand.playing_cards.all? { |card| assert_instance_of(Card, card)}
            end
        end

        describe "#empty" do
            it "removes all cards from Hand" do
                @hand.take_cards(@deck.deal_hand)

                @hand.empty

                assert_equal(0, @hand.playing_cards.size)
            end
        end

        describe "#show_hand" do
            it "returns the rank and suit of every card in a string" do
                @hand.take_cards(@deck.deal_hand)

                @hand.playing_cards.each { |card| assert(@hand.show_hand.include? card.show_card)}
            end
        end
    end
end