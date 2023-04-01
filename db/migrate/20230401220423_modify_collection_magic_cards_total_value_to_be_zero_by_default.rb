class ModifyCollectionMagicCardsTotalValueToBeZeroByDefault < ActiveRecord::Migration[7.0]
  def up
    change_column :collection_magic_cards, :total_value, :decimal, precision: 15, scale: 2, default: 0
  end

  def down
    change_column :collection_magic_cards, :total_value, :decimal, precision: 15, scale: 2, default: nil
  end
end
