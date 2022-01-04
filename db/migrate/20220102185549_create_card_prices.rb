class CreateCardPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :card_prices do |t|
      t.belongs_to :magic_card
      t.string :mtg_uuid
      t.jsonb :price_data

      t.timestamps
    end
  end
end
