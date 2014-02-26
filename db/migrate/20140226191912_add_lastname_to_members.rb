class AddLastnameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :lastname, :string
  end
end
