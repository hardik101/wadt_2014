class AddDdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :diet_msg, :string ,:default => "",:null=>false
  end
end
