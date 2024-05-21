class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :role, limit: 1, default: 0
      t.integer :admin, limit: 1, default: 0
      t.datetime :last_login

      t.timestamps
    end
  end
end
