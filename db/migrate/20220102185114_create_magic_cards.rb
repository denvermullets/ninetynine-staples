class CreateMagicCards < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_cards do |t|
      t.belongs_to :boxset
      t.string :name
      t.string :text
      t.string :original_text
      t.string :power
      t.string :toughness
      t.string :rarity
      t.string :card_type
      t.string :original_type
      t.integer :edhrec_rank
      t.boolean :has_foil
      t.boolean :has_non_foil
      t.string :border_color
      t.decimal :converted_mana_cost, precision: 10, scale: 2
      t.string :flavor_text
      t.string :frame_version
      t.boolean :is_reprint
      t.string :card_number
      t.jsonb :identifiers
      t.string :card_uuid
      t.string :image_large
      t.string :image_medium
      t.string :image_small
      t.decimal :mana_value, precision: 10, scale: 2
      t.string :mana_cost
      t.string :face_name
      t.string :card_side

      t.timestamps
    end
  end
end
