class Card
    include Comparable
    attr_accessor :rank, :suit, :value

    def initialize(rank, suit, value)
        @rank = rank
        @suit = suit
        @value = value
    end

    def show_card
        "#{@rank}#{@suit}"
    end

    def <=>(card)
        self.value <=> card.value
    end
end