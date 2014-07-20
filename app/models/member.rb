class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  ROLE =      ["I apply for a grant", "Invited Speaker", "Standard participant" ]
  DIET_PREF = ["Vegetarian" ,"Non-Vegetarian"]
  REG_FOR =  ["WADT only","IFIP only","WADT and IFIP"]
  COUNTRY = ["Afghanistan","Albania","Algeria","Andorra","Angola","Antigua & Deps","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bhutan","Bolivia","Bosnia Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Central African Rep","Chad","Chile","China","Colombia","Comoros","Congo","Congo {Democratic Rep}","Costa Rica","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Greece","Grenada","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland {Republic}","Israel","Italy","Ivory Coast","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Korea North","Korea South","Kosovo","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Mauritania","Mauritius","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Myanmar, {Burma}","Namibia","Nauru","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Qatar","Romania","Russian Federation","Rwanda","St Kitts & Nevis","St Lucia","Saint Vincent & the Grenadines","Samoa","San Marino","Sao Tome & Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Togo","Tonga","Trinidad & Tobago","Tunisia","Turkey","Turkmenistan","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"]
  HIC_COUNTRY=["Germany","France"]
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
  				        :role,:affiliation,:registered_for,:country,:is_admin,:confirmed_at

 #def after_confirmation
  #  MemberMailer.new_user_registered_email(self).deliver
  
  #end

  public
    def is_country_hic
      HIC_COUNTRY.each do |a|
        if a == self.country
          return true
        else 
          return false
        end 
       end 
    end

    def self.compute_fees

    @fees=240;
    if self.registered_for=="WADT only" && self.is_country_hic == true
        @fees=350;
    elsif self.registered_for=="WADT only" && self.is_country_hic == false
        @fees = 230;
    elsif self.registered_for=="WADT and IFIP" && self.is_country_hic == true
        @fees =590;
    elsif  self.registered_for=="WADT and IFIP" && self.is_country_hic == false
        @fees =470;
    else
       return @fees
     end 
   end
                  

  private

   def send_welcome_email
      MemberMailer.welcome_email(self).deliver
   end
 
   def send_email_to_organizer 
      MemberMailer.new_user_registered_email(self).deliver
   end 
   
   
 
   
end
