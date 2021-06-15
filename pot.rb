class Pot

    def initialize
        @total = 0
    end

    def size
        @total
    end

    def add(num)
        @total += num
    end

    def empty
        winnings = @total
        @total = 0
        winnings
    end
end