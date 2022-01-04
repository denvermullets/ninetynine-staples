class CreateMagicCardArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_card_artists do |t|
      t.belongs_to :magic_card
      t.belongs_to :artist

      t.timestamps
    end
  end
end
