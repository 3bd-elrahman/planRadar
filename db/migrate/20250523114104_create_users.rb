class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.boolean :send_due_date_reminder
      t.integer :due_date_reminder_interval
      t.time :due_date_reminder_time
      t.string :time_zone

      t.timestamps
    end
  end
end
