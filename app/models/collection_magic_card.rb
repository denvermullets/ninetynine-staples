class CollectionMagicCard < ApplicationRecord
  belongs_to :collection
  belongs_to :magic_card

  scope :by_set, ->(id, set) { includes(:magic_card).where(collection_id: id, magic_card: { boxset_id: set }) }
  scope :by_id, ->(id) { includes(:magic_card, magic_card: :boxset).where(collection_id: id) }
  scope :by_boxset, ->(id) { includes(:magic_card).where(magic_card: { boxset_id: id }) }
end
