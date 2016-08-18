class CreateTransactionItems < ActiveRecord::Migration[5.0]
  def change
    create_table :transaction_items do |t|
      t.references :transaction, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
