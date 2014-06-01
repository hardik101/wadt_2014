class AddAffiliationToMembers < ActiveRecord::Migration
  def change
  	change_table :members do |t|
      t.string :affiliation, :null => false ,:default => ""
    end
  end 

end
