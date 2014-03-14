class Stage < ActiveRecord::Base
  attr_accessible :stage_number

  




def self.WADT_stage(st_number)

     Staging_hash.fetch st_number
 end 



def self.set_st
  
  return 8

end
   




   




  
  
end
