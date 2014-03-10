class CreateAdminNotes < ActiveRecord::Migration
  def self.up
    create_table :admin_notes do |t|
      t.string :resource_id, :null => false
      t.string :resource_type, :null => false
      t.references :member, :polymorphic => true
      t.string :member,:null=>false ,:default =>""
      t.string :member_id , :null=>false
      t.string :member_type ,:null => false

      t.text :body
      t.timestamps
    end
    add_index :admin_notes, [:resource_type, :resource_id]
    add_index :admin_notes, [:member_type, :member_id]
  end

 def self.down
   drop_table:admin_notes
 end
end
