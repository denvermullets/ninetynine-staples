class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.text :description
      t.belongs_to :player, foreign_key: "player_id", null: false

      t.timestamps
    end
  end
end
