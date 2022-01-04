class CreateMagicCardKeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_card_keywords do |t|
      t.string :keyword

      t.timestamps
    end
  end
end
