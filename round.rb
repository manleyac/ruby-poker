require "./pot.rb"
require "./deck.rb"


class Round
    attr_accessor :seats, :blind, :phase, :deck, :pot

    def initialize(seats_playing, blind, num_phases)
        @seats = seats_playing
        @blind = blind
        @phase = num_phases
        @deck = Deck.new
        @pot = Pot.new
    end

    def start
        deal_out_hands
    end

    def finish_phase
        @phase -= 1
    end

    def deal_out_hands
        @seats.each do |seat|
            seat.hand.take_cards(@deck.deal_hand)
        end
    end

    # def player_bets(bet_size)
    #     bet = @seat.player.bet(bet_size)
    #     @pot.add(bet)
    # end
end