class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :commented_id
      t.string :commented_type
      t.text :body
      t.timestamps
    end
  end
end
