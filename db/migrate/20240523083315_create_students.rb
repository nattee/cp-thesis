class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :cuid
      t.string :name
      t.integer :program

      t.timestamps
    end
  end
end
