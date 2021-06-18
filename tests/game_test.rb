require "minitest/autorun"
require_relative "../player.rb"
require_relative "../seat.rb"
require_relative "../game.rb"

class  GameTest < Minitest::Test
    describe Game do

        describe "when initialized" do
            before do
                @game = Game.new(3, 10.00)
            end
            it "creates an array of seats" do
                @game.seats.all? { |seat| assert_instance_of(Seat, seat) }
            end

            it "sets initial blind size" do
                assert_equal(10.00, @game.blind_size)
            end
        end

        describe "#assign_seat" do
            before do
                @player = Player.new("test")
            end

            it "adds player to first available seat" do
                game = Game.new(2, 5)

                game.assign_seat(@player)

                assert_equal(@player.object_id, game.seats[0].player.object_id)
            end

            it "raises NoAvailableSeat error if all seats are full" do
                game = Game.new(2,5)
                game.assign_seat(@player)
                game.assign_seat(@player)

                assert_raises Game::NoAvailableSeat do
                    game.assign_seat(@player)
                end
            end
        end
    end
end