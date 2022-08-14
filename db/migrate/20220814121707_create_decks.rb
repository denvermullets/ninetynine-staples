class CreateDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :decks do |t|
      t.belongs_to :player, foreign_key: "player_id", null: false
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
