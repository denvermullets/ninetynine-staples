class CreateMagicCardArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_card_artists do |t|
      t.belongs_to :magic_card, null: false
      t.belongs_to :artist, null: false

      t.timestamps
    end
  end
end
