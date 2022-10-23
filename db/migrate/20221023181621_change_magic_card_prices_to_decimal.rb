class ChangeMagicCardPricesToDecimal < ActiveRecord::Migration[7.0]
  def change
    remove_column :magic_cards, :normal_price
    remove_column :magic_cards, :foil_price
    add_column :magic_cards, :normal_price, :decimal, precision: 12, scale: 2, default: 0
    add_column :magic_cards, :foil_price, :decimal, precision: 12, scale: 2, default: 0
  end
end
