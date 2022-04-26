class Color < ApplicationRecord
  validates :name, uniqueness: { case_sensitive: false }

  has_many :magic_card_colors
  has_many :magic_cards, through: :magic_card_colors

  has_many :magic_card_color_idents
  has_many :magic_cards, through: :magic_card_color_idents
end
