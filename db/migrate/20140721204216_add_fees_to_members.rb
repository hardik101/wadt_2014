class AddFeesToMembers < ActiveRecord::Migration
  def change
  	 change_table :members do |t|
      t.integer :fees, :null => false ,:default => 1
       end 
  end
end
