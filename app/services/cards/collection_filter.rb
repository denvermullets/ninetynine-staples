# this service pulls a players collection based on sorting params
# if there's no rarity or color specified, return whole collection (paginated)
# if rarity is only sort option, return collection that matches rarity eg: ['rare", "common"]
# if rarity and color specified, return collection w/filter
module Cards
  class CollectionFilter < Service
    # def initialize(collection:, rarity:, color:, exact:, start_range:, end_range:)
    def initialize(collection:, params:)
      @collection = collection
      @rarity = params[:rarity]&.downcase&.split(',')
      @colors = params[:color]&.upcase&.split(',')
      # i forget why i'm turning it into a boolean here but there was an issue
      # possible to look into this and see why that was happening
      @exact_match = params[:exact] == 'yes'
      @page = params[:page].to_i
      @quantity = params[:quantity].to_i
      @sort_direction = params[:sort_direction] || 'desc'
    end

    def call
      filtered_rarity = filter_rarity_cards
      filtered_color = filter_color_cards(filtered_rarity)

      return order_by_price(filtered_color) if @colors.nil? || !@exact_match

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

    def filter_cards(filtered_color)
      # Exact match scenario
      filtered_color.joins(magic_card: :magic_card_colors)
                    .select('magic_cards.*, collection_magic_cards.*')
                    .group('magic_cards.id', 'collection_magic_cards.id')
                    .having('ARRAY_AGG(colors.name ORDER BY colors.name) = ARRAY[?]::varchar[]', @colors.sort)
    end

    def order_by_price(collection)
      player_collection = collection.sorted_by_combined_prices(direction: @sort_direction)

      player_collection.where.not(quantity: nil || 0, foil_quantity: nil || 0)[start_range..end_range]
    end

    def start_range
      @page == 1 ? 0 : @quantity * (@page - 1)
    end

    def end_range
      @page == 1 ? @quantity - 1 : (@quantity * @page) - 1
    end
  end
end
