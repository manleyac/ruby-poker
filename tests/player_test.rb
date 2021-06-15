require "minitest/autorun"
require_relative "../player.rb"

class PlayerTest < Minitest::Test
    def setup
        @player = Player.new("test")
    end

    def test_player_has_name
        assert_equal( true, @player.name.size > 0)
    end
end