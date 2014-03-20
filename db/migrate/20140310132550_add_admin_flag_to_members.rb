class AddAdminFlagToMembers < ActiveRecord::Migration
  def up
    add_column :members, :is_admin, :bool,:null => false, :default => false
     

     Member.create! do |r|
      r.email      = Settings.admin_email
      r.password   = Settings.password
      r.is_admin = true
    end

    
end 


  def down
    remove_column :users, :is_admin
    Member.find_by_email(Settings.admin_email).try(:delete)
  end



  


end
