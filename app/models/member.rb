class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
  has_attached_file :proof_of_pay
  validates_attachment_presence :proof_of_pay
  do_not_validate_attachment_file_type :proof_of_pay
  validates_attachment :proof_of_pay,:size => { :in => 0..1000.kilobytes },
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png","application/pdf"] }

  ROLE =      ["I apply for a grant", "Invited Speaker", "Standard participant" ]
  DIET_PREF = ["Vegetarian" ,"Non-Vegetarian"]
  REG_FOR =  ["WADT only","IFIP only","WADT and IFIP"]
  COUNTRY = ["Afghanistan","Albania","Algeria","Andorra","Angola","Aruba","Antigua and Barbuda","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia","Bosnia Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina","Burundi","Bermuda","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Channel Islands","Central African Rep","Chad","Chile","China","Colombia","Comoros","Congo","Congo {Democratic Rep}","Costa Rica","Croatia","Cuba","Curacao","Cyprus","Czech Republic","Darussalam","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Fiji","Finland","France","Faeroe Islands","French Polynesia","Gabon","Gambia","Guam","Georgia","Germany","Ghana","Greece","Grenada","Greenland","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hungary","Hong Kong SAR, China","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Isle of Man","Italy","Ivory Coast","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea, Rep.","Korea South","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macedonia","Macao SAR, China","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Myanmar, {Burma}","Namibia","Nauru","Nepal","Netherlands","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Northern Mariana Islands","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Romania","Russian Federation","Rwanda","St. Martin (French part)","St Kitts & Nevis","St Lucia","Saint Vincent & the Grenadines","Samoa","San Marino","Sao Tome & Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Sint Maarten (Dutch part)","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Tuvalu","Turks and Caicos Islands","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","Virgin Islands (U.S.)","Vatican City","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"]
 


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
  				        :role,:affiliation,:registered_for,:country,:is_admin,:fees,:confirmed_at,:proof_of_pay

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
