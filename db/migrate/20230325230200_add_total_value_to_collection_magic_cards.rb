class AddTotalValueToCollectionMagicCards < ActiveRecord::Migration[7.0]
  def change
    add_column :collection_magic_cards, :total_value, :decimal, precision: 15, scale: 2
  end
end
