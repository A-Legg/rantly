class ChangeRantFromStringToText < ActiveRecord::Migration
  def change
    change_column :rants, :rant, :text
  end
end
