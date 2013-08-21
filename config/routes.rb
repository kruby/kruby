Kruby::Application.routes.draw do
  
  resources :texts

  resources :vouchers

  #resources :attachments, :collection => { :destroy_from_post => :delete }
  resources :attachments do
    collection do
      delete 'destroy_from_post'
    end
  end
  
  #resources :assets, :collection => { :edit_multiple => :post, :update_multiple => :put, :add_to_post => :get }
  
  resources :assets do
    collection do
      post 'edit_multiple'
      put 'update_multiple'
      get 'add_to_post'
    end
  end
  
  resources :hours
  
  resources :menus
  
  #resources :posts, :has_many => :attachments
  resources :posts do
   resources :attachments
  end
  
  resources :relations do
    resources :hours
  end
  
  resources :contents
  
  resources :recipes
  
  resources :newsarchives
  
  resources :products
  
  resources :users
  
  resource :sessions
  
  resources :pages
    #match '/active' => 'pages#active', :as => :active
    
  resources :viewer
  
  resources :posts
  
  get "logoff" => "sessions#destroy", :as => "logoff"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "logout" => "sessions#destroy", :as => "logout"
  get "log_in" => "sessions#new", :as => "log_in"
  get "login" => "sessions#new", :as => "login"
  get "sign_up" => "users#new", :as => "sign_up"
  #root :to => "users#new"
  
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  
  match '/attachments/destroy_from_post/:id/:post_id' => 'attachments#destroy_from_post', :as => :destroy_from_post
  
  match '/timeliste' => 'hours#timeliste', :as => :timeliste
  match '/monthly' => 'hours#monthly', :as => :monthly
  
  #access_denied_admin '/ingen_adgang', :controller => 'users', :action => 'no_access_admin'
  match '/ingen_adgang' => 'users#no_access_admin', :as => :access_denied_admin
  
  #user_access '/bloggen', :controller => 'posts', :action => 'blog'
  match '/bloggen' => 'posts#blog', :as => :user_access
  
  #add_to_post '/assets/add_to_post/:id', :controller => 'assets', :action => 'add_to_post'
  match '/assets/add_to_post/:id' => 'assets#add_to_post', :as => :add_to_post
    
  #bloggen '/bloggen', :controller => 'posts', :action => 'blog'
  match '/bloggen' => 'posts#blog', :as => :bloggen
  
  #miniblog '/miniblog', :controller => 'posts', :action => 'mini_blog'
  match '/miniblog' => 'posts#miniblog', :as => :miniblog
  
  #sorter_dato '/sorter_dato', :controller => 'posts', :action => 'sorter_dato'
  match '/sorter_dato' => 'posts#sorter_dato', :as => :sorter_dato
  
  #sorter_forfatter '/sorter_forfatter', :controller => 'posts', :action => 'sorter_forfatter'
  match '/sorter_forfatter' => 'posts#sorter_forfatter', :as => :sorter_forfatter

   #Routes til migreringsdata. Du kan udkommentere dem, hvis du ikke ønsker de skal virke. (Læs: så fremmede ikke kan tilgå dem.)
   #menus_data 'menus_data', :controller => 'menus', :action => 'menus_data'
   #recipes_data 'recipes_data', :controller => 'recipes', :action => 'recipes_data'
   #newsarchives_data 'newsarchives_data', :controller => 'newsarchives', :action => 'newsarchives_data'
   #products_data 'products_data', :controller => 'products', :action => 'products_data'
   #pages_data 'pages_data', :controller => 'pages', :action => 'pages_data'
   #relations_data 'relations_data', :controller => 'relations', :action => 'relations_data'
   
   #logout '/logout', :controller => 'sessions', :action => 'destroy'
   #match '/logout' => 'sessions#destroy', :as => :logout
   
   #login '/login', :controller => 'sessions', :action => 'new'
   #match '/login' => 'sessions#new', :as => :login
   
   #login '/admin', :controller => 'sessions', :action => 'new'
   #match '/admin' => 'sessions#new', :as => :login

   match 'projekter' => 'viewer#show', :as => :projekter, :name => 'projekter'
   match 'produkter' => 'viewer#show', :as => :produkter, :name => 'produkter'
   match 'kontakt' => 'viewer#show', :as => :kontakt, :name => 'kontakt'
   #De 3 ovenfor kan erstattes af linien nedenfor.
   
   #view_page ':name', :controller => 'viewer', :action => 'show'
   match ':name' => 'viewer#show', :as => :view_page
   
   #view_product ':name', :controller => 'products', :action => 'show'
   match ':name' => 'products#show', :as => :view_product

   match 'hours/years_show/:relation_id' => 'hours#show_years', :as => :show_years
   match 'hours/months_show/:relation_id/:year' => 'hours#show_months', :as => :show_months
   match 'hours/months/days_show/:relation_id/:month' => 'hours#show_days', :as => :show_days

   match 'hours/relations/:relation_id/edit/:id' => 'hours#edit', :as => :edit_hour

   match 'hours/find_all/:id' => 'hours#find_all', :as => :find_alle
   
   match 'hours/years_hide/:relation_id' => 'hours#hide_years', :as => :hide_years
   match 'hours/months_hide/:relation_id' => 'hours#hide_months', :as => :hide_months
   match 'hours/months/days_hide/:relation_id' => 'hours#hide_days', :as => :hide_days
   
   # PUBLIC
   match 'hours/months_show_public/:relation_id/:year' => 'hours#show_months_public', :as => :show_months_public
   match 'hours/months/days_show_public/:relation_id/:month' => 'hours#show_days_public', :as => :show_days_public

   match 'hours/months_hide_public/:relation_id' => 'hours#hide_months_public', :as => :hide_months_public
   match 'hours/months/days_hide_public/:relation_id' => 'hours#hide_days_public', :as => :hide_days_public
   
   #view_recipe ':name', :controller => 'recipes', :action => 'show'
   match ':name' => 'recipes#show', :as => :view_recipe
   
   #access_denied_admin '/ingen_adgang', :controller => 'users', :action => 'no_access_admin'
   match '/ingen_adgang' => 'users#no_access_admin', :as => :access_denied_admin
   
   
   # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   #root :controller => "page", :name => 'forside', :action => 'show'
   #root :controller => "viewer", :name => 'forside', :action => 'forside'
   root :to => 'viewer#forside'
   #root :controller => "pages", :id => 15
   # See how all your routes lay out with "rake routes"
   
   #connect '', :controller => 'viewer', :name => 'forside', :action => 'show'
   #####match '' => 'viewer#show', :name => 'forside'
   
   # Install the default routes as the lowest priority.
   #connect ':controller/:action/:id'
   
   #connect ':controller/:action/:id.:format'
   match ':controller(/:action(/:id(.:format)))'
   
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
