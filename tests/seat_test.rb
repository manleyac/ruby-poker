require "minitest/autorun"
require_relative "../hand.rb"
require_relative "../player.rb"
require_relative "../seat.rb"

class SeatTest < Minitest::Test

    describe Seat do
        before do
            @seat = Seat.new
            @player = Player.new("test")
        end

        describe "#add_player" do
            it "accepts a player object" do
                @seat.add_player(@player)

                assert_equal(@player.object_id, @seat.player.object_id)
            end
        end

        describe "#return_player" do
            it "returns player object" do
                @seat.add_player(@player)

                returned_player = @seat.return_player
                assert_equal(@player.object_id, returned_player.object_id)
            end

            it "sets @player to nil" do
                @seat.add_player(@player)

                @seat.return_player

                assert_nil(@seat.player)
            end
        end

        describe "#is_empty?" do
            it "returns true if seat doesn't have a player object" do
                assert(@seat.is_empty?)
            end

            it "returns false if seat has a player object" do
                @seat.add_player(@player)

                refute(@seat.is_empty?)
            end
        end
    end
end