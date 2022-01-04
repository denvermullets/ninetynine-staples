class MagicCardType < ApplicationRecord
  belongs_to :magic_card
  belongs_to :card_type
end
