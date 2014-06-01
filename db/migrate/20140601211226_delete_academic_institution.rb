class DeleteAcademicInstitution < ActiveRecord::Migration
  def change
      change_table :members do |t|
      t.remove :academic_institution
  end 

  end 
  
end
