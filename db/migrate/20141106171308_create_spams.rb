class CreateSpams < ActiveRecord::Migration
  def change
    create_table :spams do |t|
      t.integer :rant_id
      t.integer :user_id
      t.timestamps
    end
  end
end
