class CreateMagicCardKeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_card_keywords do |t|
      t.belongs_to :magic_card
      t.belongs_to :keyword

      t.timestamps
    end
  end
end
