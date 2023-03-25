# this service pulls a players collection based on sorting params
# if there's no rarity or color specified, return whole collection (paginated)
# if rarity is only sort option, return collection that matches rarity eg: ['rare", "common"]
# if rarity and color specified, return collection w/filter
module Cards
  class CollectionFilter < Service
    def initialize(collection:, params:)
      @collection = collection
      @rarity = params[:rarity]&.downcase&.split(',')
      @colors = params[:color]&.upcase&.split(',')
      @exact_match = params[:exact] == 'yes'
      @page = params[:page].to_i
      @quantity = params[:quantity].to_i
      @sort_direction = params[:sort_direction] || 'desc'
      @name = params[:search]&.downcase
    end

    def call
      filtered_by_name = filter_by_name
      filtered_rarity = filter_rarity_cards(filtered_by_name)
      filtered_color = filter_color_cards(filtered_rarity)

      return order_by_price(filtered_color) if @colors.nil?

      @exact_match ? filter_cards_exact(filtered_color) : order_by_price(filtered_color)
    end

    def filter_by_name
      if @name.blank?
        @collection
      else
        @collection.left_joins(:magic_card).where('LOWER(magic_cards.name) LIKE ?', "%#{@name}%")
      end
    end

    def filter_rarity_cards(filtered_by_name)
      if @rarity.nil?
        filtered_by_name
      else
        filtered_by_name.left_joins(:magic_card).where(magic_cards: { rarity: @rarity })
      end
    end

    def filter_color_cards(filter_rarity)
      if @colors.nil?
        filter_rarity
      else
        filter_rarity.left_joins(magic_card: { magic_card_colors: :color }).where(colors: { name: @colors }).distinct
      end
    end

    def filter_cards_exact(cards)
      magic_card_ids = MagicCardColorIdent.select(:magic_card_id)
                                          .group(:magic_card_id)
                                          .having(
                                            "ARRAY_TO_STRING(ARRAY_AGG(DISTINCT color_id), ',') = ARRAY_TO_STRING(ARRAY[?]::integer[], ',')",
                                            Color.where(name: @colors).pluck(:id)
                                          )
                                          .pluck(:magic_card_id)

      collection = cards.where(magic_card_id: magic_card_ids)
      order_by_price(collection)
    end

    def order_by_price(collection)
      sorted_collection = collection.sort_by(&:max_price)
      sorted_collection.reverse! if @sort_direction == 'desc'

      sorted_collection.select { |card| normal_quantity(card) || foil_quantity(card) }[start_range..end_range]
    end

    def start_range
      @page == 1 ? 0 : @quantity * (@page - 1)
    end

    def end_range
      @page == 1 ? @quantity - 1 : (@quantity * @page) - 1
    end

    def normal_quantity(card)
      card.quantity.present? && card.quantity.positive?
    end

    def foil_quantity(card)
      card.foil_quantity.present? && card.foil_quantity.positive?
    end
  end
end
