Wadl1::Application.routes.draw do
  
  devise_for :admin_users,ActiveAdmin::Devise.config
   root :to =>'home#index'
  ActiveAdmin.routes(self)

  match 'format',       to: 'static_pages#format',      via: 'get'
  match 'speakers',     to: 'static_pages#speakers',    via: 'get'
  match 'submission',   to: 'static_pages#submission',  via: 'get'
  match 'abstracts',    to: 'static_pages#abstracts',   via: 'get'
  match 'proceedings',  to:'static_pages#proceedings',  via: 'get'
  match 'program',      to:'static_pages#program',      via: 'get'
  match 'grants',       to:'static_pages#grants',       via: 'get'
  match 'sponsorships', to:'static_pages#sponsorships', via: 'get'
  match 'travel',       to:'static_pages#travel',       via: 'get'
  match 'sponsorships', to:'static_pages#sponsorships', via: 'get'
  match 'contact',      to:'static_pages#contact',      via: 'get'
  match 'home_page' =>  'home#index'

  match '/members/format',       to:'static_pages#format',      via: 'get'
  match '/members/speakers',     to:'static_pages#speakers',    via: 'get'
  match '/members/submission',   to:'static_pages#submission',  via: 'get'
  match '/members/abstracts',    to:'static_pages#abstracts',   via: 'get'
  match '/members/proceedings',  to:'static_pages#proceedings', via: 'get'
  match '/members/grants',       to:'static_pages#grants',      via: 'get'
  match '/members/sponsorships', to:'static_pages#sponsorships',via: 'get'
  match '/members/travel',       to:'static_pages#travel',      via: 'get'
  match '/members/sponsorships', to:'static_pages#sponsorships',via: 'get'
  match '/members/contact',      to:'static_pages#contact',     via: 'get'



  



 devise_for :members,:path_names => {:sign_up =>"register"}
 devise_for :members,:controllers => { :registration =>"registration"}
  match 'dashboard' => 'home#dashboard'
  ActiveAdmin.routes(self)

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'

  

 
   
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
