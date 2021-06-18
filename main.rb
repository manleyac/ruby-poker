require "./game.rb"
require "./player.rb"

NUM_SEATS = 2
NUM_PLAYERS = 2
BLIND_SIZE = 5

@game = nil
@players = []

def create_players()
    for i in 1..NUM_PLAYERS
        print "Enter player #{i}'s name: "
        name = gets.chomp
        print "Hello, #{name}. Enter your chip total: "
        chip_total = gets.to_f
        new_player = Player.new(name)
        new_player.stack.add(chip_total)
        @players << new_player
    end
end

def add_players_to_game()
    @players.each { |player| @game.assign_seat(player) }
end

def seat_turn(seat)
    puts "\n#{seat.player.name}, it is your turn"
    puts seat.hand.show_hand
    print "bet or pass :"
    command = gets.chomp

    if command == "bet"
        puts seat.player.status
        print "Bet size: "
        bet = gets.to_f
        @game.round.player_bets(bet, )
    end
end

def play_round
    while @game.round.phase > 0
        @game.round.seats.each do |seat|
            seat_turn(seat)
        end
        @game.round.finish_phase
    end
end

def main
    puts "Welcome to Ruby Poker!"
    @game = Game.new(NUM_SEATS, BLIND_SIZE)
    create_players
    add_players_to_game
    @game.start_round
    play_round
end

main