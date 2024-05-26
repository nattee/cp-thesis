class CreatePrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :degree
      t.string :department

      t.timestamps
    end

    add_reference :students, :program, foreign_key: true
  end
end
