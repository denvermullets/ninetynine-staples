class Deck < ApplicationRecord
  belongs_to :player

  has_many :deck_magic_cards
  has_many :magic_cards, through: :deck_magic_cards
end
