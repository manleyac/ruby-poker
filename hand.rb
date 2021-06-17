class Hand
    attr_accessor :playing_cards

    def initialize
        @playing_cards = []
    end

    def take_cards(cards)
        @playing_cards = cards
    end

    def empty
        @playing_cards.clear
    end

    def show_hand
        card_display_values = []
        @playing_cards.each { |card| card_display_values.push(card.show_card)}
        card_display_values.join(" ")
    end
end