ToDo::Application.routes.draw do
  root :to => 'lists#index'
  get '/login', controller: 'sessions', action: 'new'
  post '/sessions', controller: 'sessions', action: 'create'
  get "/logout", controller: 'sessions', action: 'destroy'

  # Routes for the List resource:
  # CREATE
  get '/lists/new', controller: 'lists', action: 'new', as: 'new_list'
  post '/lists', controller: 'lists', action: 'create'

  # READ
  get '/lists', controller: 'lists', action: 'index', as: 'lists'
  get '/lists/:id', controller: 'lists', action: 'show', as: 'list'

  # UPDATE
  get '/lists/:id/edit', controller: 'lists', action: 'edit', as: 'edit_list'
  put '/lists/:id', controller: 'lists', action: 'update'

  # DELETE
  delete '/lists/:id', controller: 'lists', action: 'destroy'
  #------------------------------

  # Routes for the Category resource:
  # CREATE
  get '/categories/new', controller: 'categories', action: 'new', as: 'new_category'
  post '/categories', controller: 'categories', action: 'create'

  # READ
  get '/categories', controller: 'categories', action: 'index', as: 'categories'
  get '/categories/:id', controller: 'categories', action: 'show', as: 'category'

  # UPDATE
  get '/categories/:id/edit', controller: 'categories', action: 'edit', as: 'edit_category'
  put '/categories/:id', controller: 'categories', action: 'update'

  # DELETE
  delete '/categories/:id', controller: 'categories', action: 'destroy'
  #------------------------------

  # Routes for the Item resource:
  # CREATE
  get '/items/new', controller: 'items', action: 'new', as: 'new_item'
  post '/items', controller: 'items', action: 'create'

  # READ
  get '/items', controller: 'items', action: 'index', as: 'items'
  get '/items/:id', controller: 'items', action: 'show', as: 'item'

  # UPDATE
  get '/items/:id/edit', controller: 'items', action: 'edit', as: 'edit_item'
  put '/items/:id', controller: 'items', action: 'update'

  # DELETE
  delete '/items/:id', controller: 'items', action: 'destroy'
  #------------------------------

  # Routes for the Collaborator resource:
  # CREATE
  get '/collaborators/new', controller: 'collaborators', action: 'new', as: 'new_collaborator'
  post '/collaborators', controller: 'collaborators', action: 'create'

  # READ
  get '/collaborators', controller: 'collaborators', action: 'index', as: 'collaborators'
  get '/collaborators/:id', controller: 'collaborators', action: 'show', as: 'collaborator'

  # UPDATE
  get '/collaborators/:id/edit', controller: 'collaborators', action: 'edit', as: 'edit_collaborator'
  put '/collaborators/:id', controller: 'collaborators', action: 'update'

  # DELETE
  delete '/collaborators/:id', controller: 'collaborators', action: 'destroy'
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get '/users/new', controller: 'users', action: 'new', as: 'new_user'
  post '/users', controller: 'users', action: 'create'

  # READ
  get '/users', controller: 'users', action: 'index', as: 'users'
  get '/users/:id', controller: 'users', action: 'show', as: 'user'

  # UPDATE
  get '/users/:id/edit', controller: 'users', action: 'edit', as: 'edit_user'
  put '/users/:id', controller: 'users', action: 'update'

  # DELETE
  delete '/users/:id', controller: 'users', action: 'destroy'
  #------------------------------

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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
