require_relative "./card.rb"

class Deck
    RANKS = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    SUITS = {club: "\u2663", diamond: "\u2662", heart: "\u2661", spade: "\u2660"}
    HAND_SIZE = 5

    attr_accessor :cards

    def initialize
        @cards = []
        RANKS.each_with_index do |rank, index|
            SUITS.each do |key, suit|
                value = index + 2
                new_card = Card.new(rank, suit, value)
                @cards << new_card
            end
        end
        @cards.shuffle!
    end

    def deal_hand
        @cards.pop(HAND_SIZE)
    end
end
