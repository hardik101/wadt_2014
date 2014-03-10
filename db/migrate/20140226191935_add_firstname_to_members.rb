class AddFirstnameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :firstname, :string,:null => false, :default => ""
  end
end
