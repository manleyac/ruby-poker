require "./game.rb"

def create_players(game)
    print "Enter number of players: "
    num_players = gets.to_i
    for i in 1..num_players
        print "Enter player #{i}'s name: "
        name = gets.chomp
        print "Hello, #{name}. Enter your chip total: "
        chip_total = gets.to_f
        game.add_player(name, chip_total)
    end
end

def main
    puts "Welcome to Ruby Poker!"
    game = Game.new
    create_players(game)
    game.start
end

main