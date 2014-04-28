class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  ROLE =      ["Student", "Invited Speaker", "Standard participant" ]
  DIET_PREF = ["Vegetarian" ,"Non-Vegetarian"]

  after_create :send_welcome_email 
  after_create :skip_conf

  def skip_conf
    (self.skip_confirmation! && self.confirm!) if self.is_admin == true
  end
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, 
  				        :remember_me ,:firstname ,
  				        :lastname,:diet_pref,:diet_msg,
  				        :role,:academic_institution,:is_admin,:confirmed_at
                  

  private
    def send_welcome_email
      MemberMailer.welcome_email(self).deliver
    end 

end
