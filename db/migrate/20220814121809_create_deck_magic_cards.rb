class CreateDeckMagicCards < ActiveRecord::Migration[7.0]
  def change
    create_table :deck_magic_cards do |t|
      t.belongs_to :deck, foreign_key: "deck_id", null: false
      t.belongs_to :magic_card, foreign_key: "magic_card_id", null: false
      t.string :name
      t.integer :quantity

      t.timestamps
    end
  end
end
