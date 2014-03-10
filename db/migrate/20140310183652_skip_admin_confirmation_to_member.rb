class SkipAdminConfirmationToMember < ActiveRecord::Migration



 def change
   
    Member.find_by_email('hardikbalar104@gmail.com') do |r|
      r.password   = 'password'
      r.password_confirmation = 'password'
      r.is_admin = true
 
      r.save!
    end


end

end
