require "minitest/autorun"
require_relative "../player.rb"

class PlayerTest < Minitest::Test

    describe Player do
        before do
            @player = Player.new("test")
        end

        describe "When initialized" do
            it "has a name" do
                assert_equal( true, @player.name.size > 0)
            end

            it "starts with an empty stack" do
                assert_equal(0, @player.stack.total_chips)
            end
        end

        describe "#bet" do
            it "withdraws chips from stack and returns it" do
                @player.stack.add(50)

                assert_equal(25, @player.bet(25))
                assert_equal(25, @player.stack.total_chips)
            end
        end

        describe "#status" do
            it "gives player name and chip total as a string" do
                @player.stack.add(50)

                assert(@player.status.include? @player.name)
                assert(@player.status.include? @player.stack.total_chips.to_s)
            end
        end
    end
end