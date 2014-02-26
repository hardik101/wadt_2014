class RegistrationController < ApplicationController

	def new
		@member= Member.new
	end

	def create

		@member = Member.new
		@member.email = params[:member][:email]
		@member.firstname = params[:member][:firstname]
		@member.lastname = params[:member][:lastname]
		@member.password = params[:member][:password]
		@member.password_confirmation =params[:member][:password_confirmation]

		@member.valid?
		if @member.errors.blank?

			@member.save
		else
			render :action => "new"
		end

	end

end
