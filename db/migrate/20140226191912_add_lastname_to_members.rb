class AddLastnameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :lastname, :string,:null => false, :default => ""
  end
end
