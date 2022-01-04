class SuperType < ApplicationRecord
  has_many :magic_card_super_types
  has_many :magic_cards, through: :magic_card_super_types
end
