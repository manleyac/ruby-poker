require "./round.rb"
require "./seat.rb"

class Game
    class NoAvailableSeat < StandardError; end

    NUM_PHASES = 3
    attr_reader :seats, :blind_size, :round

    def initialize(num_seats, blind)
        @dealer = 0
        @blind_size = blind
        @seats = Array.new(num_seats) {Seat.new}
    end

    def start_round
        @round = Round.new(@seats, @blind_size, NUM_PHASES)
        @round.start
    end

    def assign_seat(player)
        @seats.each do |seat|
            if seat.is_empty?
                seat.add_player(player)
                return
            end
        end
        raise NoAvailableSeat
    end

    # def play_hand
    #     @players.each { |player| player.accept_hand(@deck.deal_hand) }
    #     ROUNDS.times do
    #         @players.each do |player|
    #             puts "#{player.name}, it is your turn."
    #             puts player.show_hand
    #             prompt_player(player)
    #         end
    #     end
    #     finish_hand
    # end

    # def finish_hand
    #     puts "Pot: #{@pot.size}"
    #     @players.each { |player| puts "#{player.name}: #{player.show_hand}" }
    #     print "Who won? Enter 1 - #{@players.size}: "
    #     winner = gets.to_i
    #     @players[winner -1].stack.add(@pot.empty)
    #     game_status
    # end

    # def prompt_player(player)
    #     print "You can bet, or pass: "
    #     command = gets.chomp

    #     if command == "bet"
    #         puts player.status
    #         print "Bet size: "
    #         bet = gets.to_f
    #         @pot.add(player.stack.withdraw(bet))
    #     end
    # end

    # def game_status
    #     @players.each do |player|
    #         puts player.status
    #     end
    # end
end