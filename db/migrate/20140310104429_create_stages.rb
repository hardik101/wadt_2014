	class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|

    	t.integer :stage_number,:null=> false, :default=> 1
        t.timestamps
    end
  end
end
