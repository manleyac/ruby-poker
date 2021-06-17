require "./deck.rb"
require "./player.rb"
require "./pot.rb"

class Game
    ROUNDS = 3

    def initialize
        @deck = Deck.new
        @pot = Pot.new
        @players = []
    end

    def start
        play_hand
    end

    def add_player(name, chip_total)
        new_player = Player.new(name)
        new_player.stack.add(chip_total)
        @players.append(new_player)
    end

    def play_hand
        @players.each { |player| player.accept_hand(@deck.deal_hand) }
        ROUNDS.times do
            @players.each do |player|
                puts "#{player.name}, it is your turn."
                puts player.show_hand
                prompt_player(player)
            end
        end
        finish_hand
    end

    def finish_hand
        puts "Pot: #{@pot.size}"
        @players.each { |player| puts "#{player.name}: #{player.show_hand}" }
        print "Who won? Enter 1 - #{@players.size}: "
        winner = gets.to_i
        @players[winner -1].stack.add(@pot.empty)
        game_status
    end

    def prompt_player(player)
        print "You can bet, or pass: "
        command = gets.chomp

        if command == "bet"
            puts player.status
            print "Bet size: "
            bet = gets.to_f
            @pot.add(player.stack.withdraw(bet))
        end
    end

    def game_status
        @players.each do |player|
            puts player.status
        end
    end
end