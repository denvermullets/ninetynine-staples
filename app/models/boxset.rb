class Boxset < ApplicationRecord
  validates :code, uniqueness: { case_sensitive: false }

  has_many :magic_cards
end
