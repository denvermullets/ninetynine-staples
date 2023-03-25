# this service pulls a players collection based on sorting params
# if there's no rarity or color specified, return whole collection (paginated)
# if rarity is only sort option, return collection that matches rarity eg: ["rare", "common"]
# if rarity and color specified, return collection w/filter
module Cards
  class CollectionFilter < Service
    def initialize(collection:, rarity:, color:, exact:)
      @collection = collection
      @rarity = rarity&.downcase&.split(',')
      @colors = color&.upcase&.split(',')
      # i forget why i'm turning it into a boolean here but there was an issue
      # possible to look into this and see why that was happening
      @exact_match = exact == 'yes'
    end

    def call
      filtered_rarity = filter_rarity_cards
      filtered_color = filter_color_cards(filtered_rarity)

      return filtered_color unless @exact_match

      filter_cards(filtered_color)
    end

    def filter_rarity_cards
      if @rarity.nil?
        @collection
      else
        @collection.left_joins(:magic_card).where(magic_cards: { rarity: @rarity })
      end
    end

    def filter_color_cards(filter_rarity)
      if @colors.nil?
        filter_rarity
      else
        filter_rarity.left_joins(magic_card: { magic_card_colors: :color }).where(colors: { name: @colors })
      end
    end

    def filter_cards(collection)
      exact_match = []
      collection.map do |card|
        valid_colors = []
        card_colors = []

        card.magic_card.magic_card_colors.map do |magic_card_color|
          # check if card has invalid colors
          valid_colors << @colors.include?(magic_card_color.color.name)
          # throw card colors into array to check against later
          card_colors << magic_card_color.color.name
        end

        # if no false colors in array of colors, check against required colors
        # then add card to array
        if !valid_colors.include?(false)
          all_colors = []
          @colors.map do |color|
            all_colors << card_colors.include?(color)
          end

          if !all_colors.include?(false)
            exact_match << card
          end
        end
      end
      exact_match
    end
  end
end
