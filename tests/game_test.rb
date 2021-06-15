require "minitest/autorun"
require_relative "../player.rb"

class  GameTest < Minitest::Test
    def setup
        @game = Game.new
    end
end