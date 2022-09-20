class AddFoilToCollectionMagicCard < ActiveRecord::Migration[7.0]
  def change
    add_column :collection_magic_cards, :foil_quantity, :integer, default: 0
  end
end
