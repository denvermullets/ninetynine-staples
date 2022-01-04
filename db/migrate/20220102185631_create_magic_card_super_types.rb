class CreateMagicCardSuperTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :magic_card_super_types do |t|
      t.belongs_to :magic_card
      t.belongs_to :super_type

      t.timestamps
    end
  end
end
