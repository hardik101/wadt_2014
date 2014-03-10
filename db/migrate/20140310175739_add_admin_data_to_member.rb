class AddAdminDataToMember < ActiveRecord::Migration
  def change
   
    Member.find_by_email('hardikbalar104@gmail.com') do |r|
      r.password   = 'password'
      r.password_confiirmation = 'password'
      r.is_admin = true
    end

end

end 
