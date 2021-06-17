require "./hand_checker.rb"
require "./stack.rb"

class Player
    attr_accessor :name, :stack, :hand, :still_playing


    def initialize(name)
        @name = name
        @stack = Stack.new
        @hand = []
        @still_playing = true
    end

    def accept_hand(hand)
        @hand = hand
    end

    def fold_hand
        @still_playing = false
        @hand = []
    end

    def show_hand
        "#{@hand.join(" ")} Best hand: #{hand_checker(@hand)}"
    end

    def status
        "#{@name} has $#{@stack.total_chips}"
    end
end