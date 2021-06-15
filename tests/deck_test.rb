require "minitest/autorun"
require_relative "../deck.rb"

class DeckTest < Minitest::Test
    def setup
        @deck = Deck.new
    end

    def test_generate_cards
        assert_equal( 52, @deck.generate_cards.size)
    end

    def test_deal_hand
        assert_equal( Array, @deck.deal_hand.class)
    end
end