class Deck
    RANKS = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    SUITS = {club: "\u2663", diamond: "\u2662", heart: "\u2661", spade: "\u2660"}
    HAND_SIZE = 5

    def initialize
        @deck = generate_cards.shuffle
    end

    def generate_cards
        cards = []
        RANKS.each do |rank|
            SUITS.each do |key, value|
                cards << "#{rank}#{value}"
            end
        end
        cards
    end

    def fan_cards
        @deck.join(" ")
    end

    def deal_hand
        @deck.pop(HAND_SIZE)
    end
end
