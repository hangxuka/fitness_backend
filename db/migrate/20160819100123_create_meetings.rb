class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.datetime :from_date
      t.datetime :to_date
      t.references :manager, index: true, foreign_key: true
      t.integer :customer_id
      t.integer :trainer_id
      t.timestamps null: false
    end
  end
end
