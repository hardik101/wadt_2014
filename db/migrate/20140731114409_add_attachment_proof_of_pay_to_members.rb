class AddAttachmentProofOfPayToMembers < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.attachment :proof_of_pay
    end
  end

  def self.down
    remove_attachment :members, :proof_of_pay
  end
end
