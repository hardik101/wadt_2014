class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :list_stage
  helper :all

  def authenticate_admin_user!
    authenticate_member!
    unless current_member.is_admin?
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to root_path
    end
  end
 
  def current_admin_user
   return nil if member_signed_in? && !current_member.is_admin?
   current_member
  end

  def list_stage
   @list=Settings.st_hash[Stage.get_st] 
  end

end

