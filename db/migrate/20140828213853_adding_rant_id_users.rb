class AddingRantIdUsers < ActiveRecord::Migration
  def change
    add_column :users, :rant_id, :integer
  end
end
