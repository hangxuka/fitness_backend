class CreateUserMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_meetings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :meeting, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
