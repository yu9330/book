class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :pabulisher
      t.string :author
      t.string :reviw
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
