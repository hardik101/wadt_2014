Wadl1::Application.routes.draw do


root :to =>'home#index' 


  ActiveAdmin.routes(self)

   devise_for :members,
              :controllers => {:registrations => "devise/my_devise/registrations"}
  
  match 'format_location',       to: 'static_pages#Format&Location',  via: 'get',:as => :format_location
  match 'register',              to:'static_pages#Register',          via: 'get',:as => :register
  match 'speakers',              to: 'static_pages#Speakers',         via: 'get',:as => :speakers
  match 'submission',            to: 'static_pages#Submission',       via: 'get',:as => :submission
  match 'accepted_abstracts',  to: 'static_pages#AcceptedAbstracts',via: 'get',:as => :accepted_abstracts
  match 'proceedings',           to:'static_pages#Proceedings',       via: 'get',:as => :proceedings
  match 'program',               to:'static_pages#Program',           via: 'get',:as => :program
  match 'sponsors_grants',       to:'static_pages#Sponsors&Grants',   via: 'get',:as => :sponsors_grants
  match 'travel',                to:'static_pages#travel',            via: 'get',:as => :travel
  match 'contact',               to:'static_pages#Contact',           via: 'get',:as=>  :contact
  match 'important_dates',     to:'static_pages#ImportantDates',    via: 'get',:as => :important_dates
  match 'meals',                 to:'static_pages#Meals',             via: 'get',:as => :meals
  match 'information',           to:'static_pages#Information',       via: 'get',:as => :information
  match 'committees',            to:'static_pages#committees',        via: 'get',:as => :committees
  match 'accommodation',         to:'static_pages#accommodation',     via: 'get',:as => :accommodation
  match 'aims_topic',            to:'static_pages#Aims&Topic',        via: 'get',:as => :aims_topic
  match 'accepted_papers',     to:'static_pages#AcceptedPapers',    via: 'get',:as => :proceedings
  match 'finalized_reviews',   to:'static_pages#FinalizedReviews',  via: 'get', :as => :proceedings




  match 'members/format_location',         to: 'static_pages#Format&Location',  via: 'get'
  match 'members/register',                to:'static_pages#Register',          via: 'get'
  match 'members/speakers',                to: 'static_pages#Speakers',         via: 'get'
  match 'members/submission',              to: 'static_pages#Submission',       via: 'get'
  match 'members/accepted_abstracts',    to: 'static_pages#AcceptedAbstracts',via: 'get'
  match 'members/proceedings',             to:'static_pages#Proceedings',       via: 'get'
  match 'members/program',                 to:'static_pages#Program',           via: 'get'
  match 'members/sponsors_grants',         to:'static_pages#Sponsors&Grants',   via: 'get'
  
  match 'members/travel',                  to:'static_pages#travel',            via: 'get'
  match 'members/contact',                 to:'static_pages#Contact',           via: 'get'
  match 'members/accepted_papers',       to:'static_pages#AcceptedPapers',    via: 'get'

  match 'members/important_dates',       to:'static_pages#ImportantDates',    via: 'get'
  match 'members/meals',                   to:'static_pages#Meals',             via: 'get'
  match 'members/information',             to:'static_pages#Information',       via: 'get'
  match 'members/committees',              to:'static_pages#committees',        via: 'get'
  match 'members/accommodation',           to:'static_pages#accommodation',     via: 'get'
  match 'members/aims_topic',              to:'static_pages#Aims&Topic',        via: 'get'
  match 'members/finalized_reviews',     to:'static_pages#FinalizedReviews',  via: 'get'



  match 'members/password/format_location',         to: 'static_pages#Format&Location',  via: 'get'
  match 'members/password/register',                to:'static_pages#Register',          via: 'get'
  match 'members/password/speakers',                to: 'static_pages#Speakers',         via: 'get'
  match 'members/password/submission',              to: 'static_pages#Submission',       via: 'get'
  match 'members/password/accepted_abstracts',    to: 'static_pages#AcceptedAbstracts',via: 'get'
  match 'members/password/proceedings',             to:'static_pages#Proceedings',       via: 'get'
  match 'members/password/program',                 to:'static_pages#Program',           via: 'get'
  match 'members/password/sponsors_grants',         to:'static_pages#Sponsors&Grants',   via: 'get'
  match 'members/password/travel',                  to:'static_pages#travel',            via: 'get'
  match 'members/password/contact',                 to:'static_pages#Contact',           via: 'get'
  match 'members/password/accepted_papers',       to:'static_pages#AcceptedPapers',    via: 'get'
  match 'members/password/important_dates',       to:'static_pages#ImportantDates',    via: 'get'
  match 'members/password/meals',                   to:'static_pages#Meals',             via: 'get'
  match 'members/password/information',             to:'static_pages#Information',       via: 'get'
  match 'members/password/committees',              to:'static_pages#committees',        via: 'get'
  match 'members/password/accommodation',           to:'static_pages#accommodation',     via: 'get'
  match 'members/password/aims_topic',              to:'static_pages#Aims&Topic',        via: 'get'
  match 'members/password/finalized_reviews',     to:'static_pages#FinalizedReviews',  via: 'get'



  match 'members/confirmation/format_location',         to: 'static_pages#Format&Location',  via: 'get'
  match 'members/confirmation/register',                to:'static_pages#Register',          via: 'get'
  match 'members/confirmation/speakers',                to: 'static_pages#Speakers',         via: 'get'
  match 'members/confirmation/submission',              to: 'static_pages#Submission',       via: 'get'
  match 'members/confirmation/accepted_abstracts',    to: 'static_pages#AcceptedAbstracts',via: 'get'
  match 'members/confirmation/proceedings',             to:'static_pages#Proceedings',       via: 'get'
  match 'members/confirmation/program',                 to:'static_pages#Program',           via: 'get'
  match 'members/confirmation/sponsors_grants',         to:'static_pages#Sponsors&Grants',   via: 'get'
  match 'members/confirmation/travel',                  to:'static_pages#travel',            via: 'get'
  match 'members/confirmation/contact',                 to:'static_pages#Contact',           via: 'get'
  match 'members/confirmation/accepted_papers',       to:'static_pages#AcceptedPapers',    via: 'get'
  match 'members/confirmation/important_dates',       to:'static_pages#ImportantDates',    via: 'get'
  match 'members/confirmation/meals',                   to:'static_pages#Meals',             via: 'get'
  match 'members/confirmation/information',             to:'static_pages#Information',       via: 'get'
  match 'members/confirmation/committees',              to:'static_pages#committees',        via: 'get'
  match 'members/confirmation/accommodation',           to:'static_pages#accommodation',     via: 'get'
  match 'members/confirmation/aims_topic',              to:'static_pages#Aims&Topic',        via: 'get'
  match 'members/confirmation/  finalized_reviews',     to:'static_pages#FinalizedReviews',  via: 'get'

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
