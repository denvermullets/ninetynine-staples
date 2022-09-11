class RenamePlayerNameToUsername < ActiveRecord::Migration[7.0]
  def change
    rename_column :players, :name, :username
  end
end
