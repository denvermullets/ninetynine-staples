class CreateMagicCardTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_card_types do |t|
      t.belongs_to :magic_card, null: false
      t.belongs_to :card_type, null: false

      t.timestamps
    end
  end
end
