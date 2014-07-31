module ApplicationHelper

 def is_active?(link_path)

  
  if current_page?(link_path) 
  	 "active"
  else
    s2 = "/members"
    link_path.slice! s2
    current_page?(link_path) ? "active" : ""
 end

 


end 

end 



