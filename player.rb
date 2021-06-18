require "./hand_checker.rb"
require "./stack.rb"

class Player
    attr_accessor :name, :stack

    def initialize(player_name)
        @name = player_name
        @stack = Stack.new
    end

    def bet(bet_size)
        bet = @stack.withdraw(bet_size)
        bet
    end

    def status
        "#{@name} has $#{@stack.total_chips}"
    end
end