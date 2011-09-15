GaleriaArte::Application.routes.draw do
  # Catálogo
  get "catalogo/index"
  match "/catalogo" => "catalogo#index"

  get "catalogo/show"

  get "catalogo/search"

  get "catalogo/latest"

  get "catalogo/rss"


  # Obras, colecciones, artistas
  namespace :admin do 
    resources :obras do
      # Direcciones amigables '/my_resources/page/33' en lugar de '/my_resources?page=33'
      get 'page/:page/:direction/:sort', :action => "index", :on => :collection
      get 'page/:page', :action => "index", :on => :collection
      get 'ordena/:direction/:sort', :action => "index", :on => :collection
    end
  end
  namespace :admin do resources :coleccions end
  namespace :admin do resources :artista end


  # About
  get "about/index"
  match "/about" => "about#index"

  

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

  root :to => "catalogo#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
