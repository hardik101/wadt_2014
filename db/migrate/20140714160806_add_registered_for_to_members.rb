class AddRegisteredForToMembers < ActiveRecord::Migration
  def change
  change_table :members do |t|
      t.string :registered_for, :null => false ,:default => "WADT only"
   end
 end
end
