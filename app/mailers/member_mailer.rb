class MemberMailer < ActionMailer::Base
  default from: Settings.email

	def welcome_email(member)
		@member =member
		mail(to: @member.email, subject: "Thank you for registering for the WADT-2014")
	end

end

