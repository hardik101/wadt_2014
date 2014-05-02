class AddAdminFlagToMembers < ActiveRecord::Migration
  def up
    add_column :members, :is_admin, :bool,:null => false, :default => false
    add_column :members, :firstname, :string,:null => false, :default => ""
    add_column :members, :lastname, :string,:null => false, :default => ""
    add_column :members, :role, :string,:null => false, :default => ""
    add_column :members, :diet_pref, :string,:null => false, :default => ""
    add_column :members, :academic_institution, :string,:null => false, :default => ""

end 


  def down
    remove_column :members, :is_admin
    Member.find_by_email(Settings.admin_email).try(:delete)
  end



  


end
