ActiveAdmin.register Member do

  index do 

    column :email
    column  :firstname
    column :lastname
    column :diet_msg
    column :affiliation
    column :country
    column :registered_for
    column :role
    column  "Email confirmed at" , :confirmed_at
    column :fees
    column :is_admin
    

    actions
  end 

  form do |f|
    f.inputs "Member Details" do
      f.input :firstname
      f.input :lastname
      f.input :registered_for
      f.input :diet_msg
      f.input :affiliation
      f.input :country , :as=>:string
      f.input :role
      f.input :password
      f.input :password_confirmation
      f.input :is_admin, :label => "Super Administrator"
    end
    f.buttons
  end

  create_or_edit = Proc.new {
    @member            = Member.find_or_create_by_id(params[:id])
    @member.is_admin = params[:member][:is_admin]
    @member.attributes = params[:member].delete_if do |k, v|
      (k == "is_admin") ||
      (["password", "password_confirmation"].include?(k) && v.empty? && !@member.new_record?)
    end
    if @member.save
      redirect_to :action => :show, :id => @member.id
    else
      render active_admin_template((@member.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit

end