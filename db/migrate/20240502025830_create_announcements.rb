class CreateAnnouncements < ActiveRecord::Migration[7.1]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :detail
      t.integer :available, limit: 1

      t.timestamps
    end
  end
end
