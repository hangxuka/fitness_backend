class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :birthday
      t.string :tel_number
      t.string :address
      t.float :salary
      t.float :meeting_money
      t.datetime :registry_date
      t.datetime :expiry_date
      t.string :avatar
      t.integer :role
      t.references :manager, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
