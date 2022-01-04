class CreateMagicCardColors < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_card_colors do |t|
      t.belongs_to :magic_card
      t.belongs_to :color

      t.timestamps
    end
  end
end
