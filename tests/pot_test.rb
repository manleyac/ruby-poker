require "minitest/autorun"
require_relative "../pot.rb"

class PotTest < Minitest::Test
    def setup
        @pot = Pot.new
    end

    def test_pot_starts_at_zero
        assert_equal( 0, @pot.size)
    end

    def test_adding_to_pot
        assert_in_epsilon( 20, @pot.add(20.0), epsilon = 0.0001)
    end

    def test_adding_more_to_pot
        @pot.add(20.0)

        assert_in_epsilon( 35.0, @pot.add(15.0), epsilon = 0.0001)
    end

    def test_taking_pot
        @pot.add(1000)

        assert_equal 1000, @pot.empty
        assert_equal 0, @pot.size
    end
end