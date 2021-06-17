require "minitest/autorun"
require_relative "../player.rb"

class PlayerTest < Minitest::Test
    def setup
        @player = Player.new("test")
    end

    def test_player_has_name
        assert_equal( true, @player.name.size > 0)
    end

    describe "#fold_hand" do
        describe "When player folds a hand" do
            it "sets @still_playing to false" do
                @player = Player.new("test")

                @player.fold_hand

                assert_equal(false, @player.still_playing)
            end

            it "clears player's hand" do
                @player = Player.new("test")

                @player.fold_hand

                assert_empty @player.hand
            end
        end
    end
end