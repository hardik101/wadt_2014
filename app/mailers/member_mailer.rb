class MemberMailer < ActionMailer::Base
  default from: Settings.email

	def welcome_email(member)
		@member =member
		mail(to: @member.email, subject: "Thank you for registering for the #{Settings.name}")
	end

	def new_user_registered_email(member)
		@member = member
		mail(to: Settings.contact ,subject:"New member registered for #{Settings.name}")
	end 

end

