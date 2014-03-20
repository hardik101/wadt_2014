class Stage < ActiveRecord::Base
  attr_accessible :stage_number

 def self.get_st
  Stage.first.stage_number
 end
  
end
 