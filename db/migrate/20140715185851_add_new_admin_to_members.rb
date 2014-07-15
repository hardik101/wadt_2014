class AddNewAdminToMembers < ActiveRecord::Migration
  def change

  @admin=Member.new(email:Settings.admin_email,firstname:'Admin',lastname: 'admin', password:Settings.password,is_admin: true)

  @admin.skip_confirmation!
  @admin.confirm!

  @admin.save
  end
end
