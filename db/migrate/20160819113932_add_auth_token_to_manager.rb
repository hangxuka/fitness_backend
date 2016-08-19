class AddAuthTokenToManager < ActiveRecord::Migration[5.0]
  def change
    add_column :managers, :auth_token, :string
  end
end
