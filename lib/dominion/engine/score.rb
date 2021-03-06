module Dominion
  module Engine
    class Score
      
      def self.calculate(player)
        Score.new(player).calculate
      end
      
      attr_accessor :player, :points
      
      def initialize(player)
        @player = player
        @points = 0
      end
      
      def <=>(other)
        other.points <=> points
      end
      
      # Destructive! combines all players cards into their deck
      def calculate
        player.combine_cards
        player.deck.each do |card|
          if card.is_a? Victory
            @points += card.points player
          end
        end
        self
      end
      
    end
  end
end