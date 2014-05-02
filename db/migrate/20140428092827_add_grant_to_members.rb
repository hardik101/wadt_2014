class AddGrantToMembers < ActiveRecord::Migration
  def change
    add_column :members, :grant, :bool ,:default => false
  end
end
