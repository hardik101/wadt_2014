class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  ROLE =      ["Student", "Invited Speaker", "Guest" ]
  DIET_PREF = ["Vegetarian" ,"Non-Vegetarian", "Doesn't matter"]

  after_create :send_welcome_email 
  after_create :skip_conf!

  def skip_conf!
    self.confirm! if self.is_admin?
  end
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, 
  				        :remember_me ,:firstname ,
  				        :lastname,:diet_pref,
  				        :role,:academic_institution,:is_admin,:confirmed_at
                  

  private
    def send_welcome_email
      MemberMailer.welcome_email(self).deliver
    end 

end
