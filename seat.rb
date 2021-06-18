require_relative "./hand.rb"

class Seat
    attr_accessor :player, :hand

    def initialize
        @hand = Hand.new
        @player = nil
    end

    def add_player(player)
        @player = player
    end

    def return_player()
        player = @player
        @player = nil
        player
    end

    def is_empty?
        @player.nil?
    end

end