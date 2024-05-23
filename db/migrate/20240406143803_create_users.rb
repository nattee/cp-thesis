class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :role, limit: 1, default: 0
      t.boolean :admin, limit: 1, default: 0
      t.datetime :last_login
      t.references :student, null: true
      t.references :faculty, null: true

      t.timestamps
    end
  end
end
