Rails.application.routes.draw do

  resources :categories

  resources :jobs

  resources :job_applications

  root :to => 'demo#landing'

  # root :to => 'demo#landing'

  # get 'demo/index'

  # devise_for :users
  # config/routes.rb
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, :has_one => :job_seeker
  resources :admin_users

  resources :login

  resources :user

  resources :jobs

  resources :demo

  get "error"=>"demo#error",:as => "error"
  get "contact"=>"demo#contact", :as => "contact"
  resources :employers

  resources :job_seeker
  post "/status" =>  "job_applications#status"

  resources :job_applications
  get "applicationsbyjobid" => "jobapplications#applicationsbyjobid", :as =>"applicationsbyjobid"

  get "edit_status" =>"jobapplications#editstatus", :as =>"edit_applicationstatus"
  get "create_job" =>"jobs#new", :as =>"create_job"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

 # get '*path' => redirect('/')

match ':controller(/:action(/:id))', :via => [:get,:post]

end
