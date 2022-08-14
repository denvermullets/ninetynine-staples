class CreateCollectionMagicCards < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_magic_cards do |t|
      t.belongs_to :collection, foreign_key: "collection_id", null: false
      t.belongs_to :magic_card, foreign_key: "magic_card_id", null: false
      t.integer :quantity
      t.string :condition
      t.text :notes

      t.timestamps
    end
  end
end
