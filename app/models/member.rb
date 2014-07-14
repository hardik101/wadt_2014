class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  ROLE =      ["I apply for a grant", "Invited Speaker", "Standard participant" ]
  DIET_PREF = ["Vegetarian" ,"Non-Vegetarian"]
  REG_FOR =  ["WADT only","IFIP only","WADT and IFIP"]

  after_create :send_email_to_organizer 

  after_save :send_welcome_email, :if => proc { |l| l.confirmed_at_changed? && l.confirmed_at_was.nil? }

  after_create :skip_conf

  def skip_conf
    (self.skip_confirmation! && self.confirm!) if self.is_admin == true
  end
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, 
  				        :remember_me ,:firstname ,
  				        :lastname,:diet_pref,:diet_msg,
  				        :role,:affiliation,:registered_for,:is_admin,:confirmed_at

 #def after_confirmation
  #  MemberMailer.new_user_registered_email(self).deliver
  
  #end
                  

  private

    def send_welcome_email
      MemberMailer.welcome_email(self).deliver
    end
 
   def send_email_to_organizer 
      MemberMailer.new_user_registered_email(self).deliver
   end 

end
