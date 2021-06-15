require "./hand_checker.rb"
require "./stack.rb"

class Player
    attr_accessor :name, :stack


    def initialize(name)
        @name = name
        @stack = Stack.new
        @hand = []
    end

    def accept_hand(hand)
        @hand = hand
    end

    def show_hand
        "#{@hand.join(" ")} Best hand: #{hand_checker(@hand)}"
    end

    def status
        "#{@name} has $#{@stack.total_chips}"
    end
end