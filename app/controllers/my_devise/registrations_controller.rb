class MyDevise::RegistrationsController < Devise::RegistrationsController

HIC_COUNTRY=["Andorra", "Korea, Rep.","Antigua and Barbuda", "Kuwait","Aruba","Latvia",
"Australia", "Liechtenstein", "Austria", "Lithuania",
"Bahamas","Luxembourg", "Bahrain","Macao SAR, China",
"Barbados", "Malta", "Belgium","Monaco", "Bermuda", "Netherlands","Brunei","Darussalam",
"New Caledonia","Canada","New Zealand","Cayman Islands","Northern Mariana Islands","Channel Islands",
"Norway", "Chile", "Oman", "Croatia", "Poland", "Curacao", "Portugal", "Cyprus", "Puerto Rico", "Czech Republic", "Qatar",
"Denmark",
"Russian Federation","Equatorial Guinea","San Marino","Estonia","Saudi Arabia","Faeroe Islands","Singapore","Finland",
"Sint Maarten (Dutch part)","France","Slovakia","French Polynesia","Slovenia","Germany",
"Spain","Greece","St. Martin (French part)","Greenland","Sweden","Guam","Switzerland","Hong Kong SAR, China",
"Trinidad & Tobago","Iceland","Turks and Caicos Islands","Ireland","United Arab Emirates","Isle of Man",
"United Kingdom","Israel","United States","Italy","Uruguay","Japan","Virgin Islands (U.S.)"]

def create

build_resource(sign_up_params)

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved

      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        #set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        compute_fees(resource)
        resource.save
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end

end 


def compute_fees(resource)
  
  if resource.registered_for == "IFIP only"
  resource.fees =240;
  set_flash_message :notice, :fees_to_pay_0 if is_flashing_format?
  elsif resource.registered_for == "WADT only" && is_country_hic?(resource.country)==true 
    set_flash_message :notice, :fees_to_pay_1 if is_flashing_format?
    resource.fees=350;
  elsif resource.registered_for == "WADT only" && is_country_hic?(resource.country)==false
    set_flash_message :notice, :fees_to_pay_2 if is_flashing_format?
    resource.fees=230;
  elsif resource.registered_for == "WADT and IFIP" && is_country_hic?(resource.country)==true
    set_flash_message :notice, :fees_to_pay_3 if is_flashing_format?
      resource.fees =590
   elsif resource.registered_for == "WADT and IFIP" && is_country_hic?(resource.country)==false
    set_flash_message :notice, :fees_to_pay_4 if is_flashing_format?
      resource.fees = 470
  
  end 

end 

def is_country_hic?(country)

 HIC_COUNTRY.each do |a|
        if a == country
          return true
        end   
        end 

      return false
  end 



end 
