class CreateMagicCardRulings < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_card_rulings do |t|
      t.belongs_to :magic_card
      t.belongs_to :ruling

      t.timestamps
    end
  end
end
