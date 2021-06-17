class Stack
    class InvalidBetAmount < StandardError; end

    attr_reader :total_chips

    def initialize()
        @total_chips = 0.00
    end

    def add(amount)
        @total_chips += amount
    end

    def withdraw(num = 10)
        raise InvalidBetAmount if num < 0 || (@total_chips - num) < 0

        @total_chips -= num
        num
    end

end