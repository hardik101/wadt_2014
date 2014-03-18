Wadl1::Application.routes.draw do


root :to =>'home#index'

  ActiveAdmin.routes(self)

   devise_for :members
  

  match 'Format%20&%20Location', to: 'static_pages#Format&Location',via: 'get'
  match 'Register',              to:'static_pages#Register',          via: 'get'
  match 'Speakers',              to: 'static_pages#Speakers',         via: 'get'
  match 'Submission',            to: 'static_pages#Submission',      via: 'get'
  match 'Accepted%20Abstracts',    to: 'static_pages#AcceptedAbstracts',via: 'get'
  match 'Proceedings',           to:'static_pages#Proceedings',  via: 'get'

  match 'Program',               to:'static_pages#Program',via: 'get'
  match 'Sponsors%20&%20Grants', to:'static_pages#Sponsors&Grants', via: 'get'
  
  match 'Travel',                to:'static_pages#travel',       via: 'get'
  match 'Contact',               to:'static_pages#Contact',      via: 'get'

  match 'Important%20Dates',     to:'static_pages#ImportantDates',  via: 'get'
  match 'Meals',                 to:'static_pages#Meals',           via: 'get'
  match 'Information',           to:'static_pages#Information',     via: 'get'
  match 'Committees',            to:'static_pages#committees',      via: 'get'
  match 'Accomodation',          to:'static_pages#Accomodation',      via: 'get'
  match 'Aims%20 & %20Topic',          to:'static_pages#Aims&Topic',      via: 'get'




  
 

  # The priority is based upon order of creation:
  # first created -> highest priority.



  

 
   
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
