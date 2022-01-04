class CreateRulings < ActiveRecord::Migration[7.0]
  def change
    create_table :rulings do |t|
      t.date :ruling_date
      t.string :ruling

      t.timestamps
    end
  end
end
