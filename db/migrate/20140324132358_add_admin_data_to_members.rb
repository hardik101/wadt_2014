class AddAdminDataToMembers < ActiveRecord::Migration
  def change
  
  @admin=Member.new(email: Settings.admin_email,password:Settings.password,is_admin: true)

  @admin.skip_confirmation!
  @admin.confirm!

  @admin.save

  end
end
