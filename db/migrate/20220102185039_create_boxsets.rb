class CreateBoxsets < ActiveRecord::Migration[7.0]
  def change
    create_table :boxsets do |t|
      t.string :code
      t.integer :mcm_id
      t.string :name
      t.string :mcm_name
      t.date :release_date
      t.integer :base_set_size
      t.integer :total_set_size
      t.string :set_type

      t.timestamps
    end
  end
end
