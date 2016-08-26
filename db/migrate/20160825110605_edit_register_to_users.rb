class EditRegisterToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :registry_date
    remove_column :users, :expiry_date
    add_column :users, :expiry_date, :string
    add_column :users, :registry_date, :string
  end
end
