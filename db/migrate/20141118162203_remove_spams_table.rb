class RemoveSpamsTable < ActiveRecord::Migration
  def change
    drop_table :spams
  end
end
