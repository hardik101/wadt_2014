class AddAcademicInstitutionToMembers < ActiveRecord::Migration
  def change
    add_column :members, :academic_institution, :string
  end
end
