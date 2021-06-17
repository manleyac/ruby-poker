require "minitest/autorun"
require_relative "../stack.rb"

class StackTest < Minitest::Test
    def setup
        @stack = Stack.new
    end

    def test_total_starts_at_zero
        assert_equal(0.00, @stack.total_chips)
    end

    def test_adding_to_stack
        @stack.add(15.00)

        assert_equal(15.00, @stack.total_chips)
    end

    describe "#bet" do

        describe "when no arg is given" do
            it "defaults to a bet of 10" do
                @stack = Stack.new
                @stack.add(25)

                assert_equal(10, @stack.withdraw)
            end
        end

        describe "when num arg is greater than or equal to total" do
            it "throws an error and doesn't modify stack total" do
                @stack = Stack.new
                @stack.add(50)

                assert_raises Stack::InvalidBetAmount do
                    @stack.withdraw(75)
                end
                assert_equal(50, @stack.total_chips)
            end
        end

        describe "when num is less than zero" do
            it "throws an error" do
                @stack = Stack.new
                @stack.add(50)
                assert_raises Stack::InvalidBetAmount do
                    @stack.withdraw(-20)
                end
                assert_equal(50, @stack.total_chips)
            end
        end

    end

    describe "when num arg is less than or equal to @total and greater than or equal to zero" do
        it "decriments total and returns num" do
            @stack = Stack.new
            @stack.add(100)

            assert_equal(25, @stack.withdraw(25))
            assert_equal(75, @stack.total_chips)
        end
    end
end