class RemoveCommented < ActiveRecord::Migration
  def change
    remove_column :comments, :commented_id
    remove_column :comments, :commented_type


  end
end
