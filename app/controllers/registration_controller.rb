class RegistrationController < Devise::RegistrationsController


def new 

@member =Memeber.new

end

def create 


@member = Member.new

@member.email = params[:member][:email]
@member.password = params[:member][:password]
@member.password_confirmation =params[:member][:password_confirmation]
@member.firstname = params[:member][:firstname]
@member.lastname = params[:member][:lastname]
@member.role = params[:member][:role]
@member.diet_pref = params[:member][:diet_pref]
@member.academic_institution = params[:member][:academic_institution]

@member.valid?
if @member.errors.blank?
@contact.save
redirect_to dashboard_path

else
render :action => "new"
end



end



end
