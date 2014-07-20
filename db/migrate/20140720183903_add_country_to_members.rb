class AddCountryToMembers < ActiveRecord::Migration
  def change

  	 change_table :members do |t|
      t.string :country, :null => false ,:default => "Germany"
       end 
  end
end
