class AddDefaultToCreateadminnotes < ActiveRecord::Migration
  def change
  	create_table :admin_notes do |t|
  	t.string :member,:null=>false ,:default =>"member"
  end

end 

end
