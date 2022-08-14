class DeckMagicCard < ApplicationRecord
  belongs_to :deck
  belongs_to :magic_card
end
