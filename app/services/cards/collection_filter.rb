module Cards
  class CollectionFilter < Service
    def initialize(collection:, rarity:, color:, exact:)
      @collection = collection
      @rarity = rarity.nil? ? nil : rarity.downcase.split(',')
      @colors = color.nil? ? nil : color.upcase.split(',')
      @exact_match = exact == 'yes'
    end

    def call
      return @collection if @rarity.nil? && @colors.nil?

      return filter_rarity_cards if !@rarity.nil? && @colors.nil?

      filter_rarity = filter_rarity_cards
      filter_color = filter_color_cards(filter_rarity)

      if @exact_match
        filter_cards(filter_color)
      else
        filter_color
      end
    end

    def filter_rarity_cards
      if @rarity.nil?
        @collection
      else
        @collection.includes(:magic_card).where(magic_card: { rarity: @rarity })
      end
    end

    def filter_color_cards(filter_rarity)
      if @colors.nil?
        filter_rarity
      else
        filter_rarity.includes(magic_card: :colors).where(magic_card: { colors: { name: @colors } })
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
