class CreatePrintings < ActiveRecord::Migration[7.0]
  def change
    create_table :printings do |t|
      t.belongs_to :magic_card
      t.string :code

      t.timestamps
    end
  end
end
