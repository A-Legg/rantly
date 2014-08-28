class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :rant
      t.integer :user_id


      t.timestamps
    end
  end
end
