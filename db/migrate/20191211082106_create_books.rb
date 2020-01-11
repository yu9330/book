class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :publisher
      t.string :author
      t.string :review
      t.date :start_date
      t.date :end_date
      t.string :status
      t.integer :user_id
      t.timestamps
    end
  end
end
