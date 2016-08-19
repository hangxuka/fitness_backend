class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.references :manager, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
