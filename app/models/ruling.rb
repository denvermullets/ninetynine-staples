class Ruling < ApplicationRecord
  has_many :magic_card_rulings
  has_many :magic_cards, through: :magic_card_rulings
end
