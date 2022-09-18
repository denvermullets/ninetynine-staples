class AddValidCardsToBoxsets < ActiveRecord::Migration[7.0]
  def change
    add_column :boxsets, :valid_cards, :boolean, null: false, default: false
  end
end
