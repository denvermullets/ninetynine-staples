class CardType < ApplicationRecord
  has_many :magic_card_types
  has_many :magic_cards, through: :magic_card_types
end
