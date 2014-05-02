class AddStageNumberToStages < ActiveRecord::Migration
  def change
    Stage.create! do |r|
      r.stage_number =3 
    end
  end
end
