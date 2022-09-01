class Collection < ApplicationRecord
  belongs_to :player

  has_many :collection_magic_cards
  has_many :magic_cards, through: :collection_magic_cards

  scope :by_player, ->(id) { where(player_id: id) }
end
