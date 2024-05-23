class CreateExams < ActiveRecord::Migration[7.1]
  def change
    create_table :exams do |t|
      t.references :proposal, null: false, foreign_key: true
      t.integer :status, limit: 1, default: 0
      t.boolean :advisor_approved, default: 0
      t.datetime :exam_date
      t.string :place
      t.string :chair
      t.string :com1
      t.string :com2
      t.string :com3
      t.string :ex_com

      t.timestamps
    end
  end
end
