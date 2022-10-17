class AddPricesToMagicCards < ActiveRecord::Migration[7.0]
  def change
    add_column :magic_cards, :normal_price, :string
    add_column :magic_cards, :foil_price, :string
  end
end
