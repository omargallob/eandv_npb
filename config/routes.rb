ActionController::Routing::Routes.draw do |map|
  
  
  map.resources :services #, :path_prefix => ":locale"
  map.resources :properties,:collection => {:feed => :get}
  map.resources :rss,:collection => {:favs => :get,:properties => :get}
  
  

  #user action ( login signup logout)
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session
  #map.namespace :services do |services|
   # services.pare
  #end
 
  map.services_par '/services/:category', :controller => "services", :action => "show"
  
  map.services_sub '/services/:category/:subcategory', :controller => "services", :action => "show"
  #admin section
  map.namespace :admin  do |admin|
     admin.root :controller => "overview"
     admin.resources :pages
     admin.resources :metatag
     admin.resources :services
     admin.resources :types
     admin.resources :categories
     admin.resources :countries
     admin.resources :locations
     admin.country '/:country/locations', :controller => "locations", :action => "index"
     admin.new_location '/:country/locations/new', :controller => "locations", :action => "new" 
     admin.edit_location '/:country/locations/:id/edit', :controller => "locations", :action => "edit"
     admin.update_location '/locations/:id', :controller => "locations", :action => "update"
     admin.resources :developments
     admin.developments '/:country/:zipcod/developments', :controller => "developments", :action => "index"
     admin.new_development '/:country/:zipcod/developments/new', :controller => "developments", :action => "new"
     admin.edit_development '/:country/:zipcod/developments/:id/edit', :controller => "developments", :action => "edit"
     admin.resources :properties
     admin.update_fp 'properties/:property_id/update_fp',:controller => "properties", :action => "update_featured_photo"
     admin.resources :facilities
     admin.resources :users
     admin.resources :roles
     admin.resources :galleries
     admin.resources :galleries, :collection => { :prioritize_uploads => :post }
      admin.resources :uploads
      admin.update_gallery 'galleries/:id', :controller=>"galleries",:action => "update"
     #admin.namespace :property do |property|
      # property.resources :galleries
     #end
     #admin.property_facilities '/location/:location_id/property/:property_id/facilities', :controller => 'facilities', :action => "index"
     #admin.new_facility '/location/:location_id/property/:property_id/facilities/new', :controller => 'facilities', :action => "new"
     #admin.edit_facility '/location/:location_id/property/:property_id/facility/:id/edit', :controller => 'facilities', :action => "new"
     #admin.update_facility '/location/:location_id/property/:property_id/facilities',:controller => "facilities", :action => "update"

  end
  
  map.view_page ':name', :controller => 'viewer', :action => 'show'
  map.feed_properties '/rss/properties.:format', :controller => 'properties', :action => 'feeds'
  map.feed_favs '/rss/favs.:format', :controller => 'rss', :action => 'favs'
  
 # map.feed_properties '/rss/properties.:format', :controller => 'rss', :action => 'properties'
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "viewer", :action=>"show", :name => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
 
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect 'properties/feed.:format', :controller => 'properties', :action => 'feed'
  map.connect ':controller/:action.:format'
  #map.connect '/properties/favs.:format',:controller=>"properties",:action=>'favs'
end
