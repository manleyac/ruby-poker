RANKING = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

def hand_checker(hand)
    card_ranks = []
    best_hand = []

    hand.each do |card|
        card_value = RANKING.find_index(card[0..-2])
        card_ranks << card_value
    end

    freq = card_ranks.inject(Hash.new(0)) {|h,v| h[v] += 1; h}
    freq.keys.sort.reverse.each do |key|
        if freq[key] > 1
            best_hand << "#{freq[key]} #{RANKING[key]}'s"
        end
    end
    
    max_value = card_ranks.max_by { |v| freq[v]}
    best_card = RANKING[card_ranks.max]
    freq[max_value] > 1 ? "#{best_hand.join(", ")}" : "#{best_card} high"
end
