class AddPasswordToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :password_digest, :string, null: false, default: 'this is a temp password'
  end
end
