class MagicCardColor < ApplicationRecord
  belongs_to :color
  belongs_to :magic_card
end
