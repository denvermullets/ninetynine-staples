class MagicCardArtist < ApplicationRecord
  belongs_to :magic_card
  belongs_to :artist
end
