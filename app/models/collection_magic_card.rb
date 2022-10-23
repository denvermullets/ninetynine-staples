class CollectionMagicCard < ApplicationRecord
  belongs_to :collection
  belongs_to :magic_card

  scope :by_set, ->(id, set) { includes(:magic_card).where(collection_id: id, magic_card: { boxset_id: set }) }
  scope :by_id, ->(id) { includes(:magic_card, magic_card: :boxset).where(collection_id: id) }
  scope :by_boxset, ->(id) { includes(:magic_card).where(magic_card: { boxset_id: id }) }
  scope :order_by_price, -> { includes(:magic_card).order(['magic_cards.normal_price desc', 'magic_cards.foil_price desc']) }
end
