class CreateMagicCardColorIdents < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_card_color_idents do |t|
      t.belongs_to :magic_card, null: false
      t.belongs_to :color, null: false

      t.timestamps
    end
  end
end
