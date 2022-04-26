class Keyword < ApplicationRecord
  validates :keyword, uniqueness: { case_sensitive: false }

  has_many :magic_card_keywords
  has_many :magic_cards, through: :magic_card_keywords
end
