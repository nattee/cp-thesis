class CreateProposals < ActiveRecord::Migration[7.1]
  def change
    create_table :proposals do |t|
      t.references :student, null: false, foreign_key: true
      t.string :name_th
      t.string :name_en
      t.references :advisor, null: false, foreign_key: {to_table: :faculties}

      t.timestamps
    end
  end
end
