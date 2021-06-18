require "minitest/autorun"
require_relative "../player.rb"
require_relative "../seat.rb"
require_relative "../round.rb"

class RoundTest < Minitest::Test

    describe Round do
        before do
            seats_array = Array.new(2) {Seat.new}
            blind_size = 5
            num_phases = 3
            @round = Round.new(seats_array, blind_size, num_phases)
        end

        describe "when initialized" do
            
        end
    end
end