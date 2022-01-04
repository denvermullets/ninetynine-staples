class Artist < ApplicationRecord
  has_many :magic_card_artists
  has_many :magic_cards, through: :magic_card_artists
end
