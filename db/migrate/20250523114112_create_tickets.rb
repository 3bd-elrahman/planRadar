class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|

      t.string :title, null: false
      t.text :description
      t.date :due_date
      t.integer :status_id
      t.integer :progress

      t.references :user, null: false, foreign_key: true


      t.timestamps
    end
  end
end
