class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :cuid
      t.string :name
      t.integer :program
      t.integer :start_term, default: 1
      t.integer :start_year

      t.timestamps
    end
  end
end
