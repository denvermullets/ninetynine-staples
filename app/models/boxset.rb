class Boxset < ApplicationRecord
  validates :code, uniqueness: { case_sensitive: false }

  has_many :magic_cards

  scope :all_sets, -> { order(release_date: :desc).where.not(total_set_size: 0).where(valid_cards: true) }
end
