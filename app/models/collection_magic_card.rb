class CollectionMagicCard < ApplicationRecord
  belongs_to :collection
  belongs_to :magic_card

  scope :by_set, ->(id, set) { includes(:magic_card).where(collection_id: id, magic_card: { boxset_id: set }) }
  scope :by_id, ->(id) { includes(:magic_card, magic_card: :boxset).where(collection_id: id) }
  scope :by_boxset, ->(id) { left_joins(:magic_card).where(magic_cards: { boxset_id: id }) }
  # AI gave me this scope ;_;. sorts by whichever price is higher if quantity exists
  scope :sorted_by_combined_prices, ->(direction: 'desc') {
    direction = %w[asc desc].include?(direction.downcase) ? direction.downcase : 'desc'
    magic_cards_table = MagicCard.arel_table
    collection_magic_cards_table = CollectionMagicCard.arel_table
    greatest_price = Arel::Nodes::NamedFunction.new(
      'GREATEST',
      [
        Arel::Nodes::Case.new
          .when(collection_magic_cards_table[:foil_quantity].eq(0))
          .then(magic_cards_table[:normal_price])
          .else(magic_cards_table[:foil_price])
      ]
    )
    order_clause = "#{greatest_price.to_sql} #{direction.upcase}"
    joins(:magic_card)
      .select('collection_magic_cards.*, magic_cards.normal_price, magic_cards.foil_price')
      .order(Arel.sql(order_clause))
  }

  def max_price
    [magic_card.normal_price || 0, magic_card.foil_price || 0].max
  end
end
