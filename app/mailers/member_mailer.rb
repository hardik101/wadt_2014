class MemberMailer < ActionMailer::Base
  default from: Settings.email

	def welcome_email(member)
		@member =member
		mail(to: @member.email, subject: "Thank you for registering for #{Settings.conf_name}-2014")
	end

	def new_user_registered_email(member)
		@member = member
		mail(to: Settings.contact ,subject:"New user registered for #{Settings.conf_name}")
	end 

end

