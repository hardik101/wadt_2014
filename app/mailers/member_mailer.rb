class MemberMailer < ActionMailer::Base
  default from: "hardikbalar102@gmail.com"



  def welcome_email(member)

   @member =member

   mail(to: @member.email, subject: "Thank you for registering for the WADT-2014"	)
end
