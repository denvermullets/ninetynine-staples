class CreateMagicCards < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_cards do |t|
      t.string :name
      t.string :text
      t.string :power
      t.string :toughness
      t.string :rarity
      t.string :set_code
      t.string :card_type

      t.timestamps
    end
  end
end
