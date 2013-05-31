ToDo::Application.routes.draw do
  root :to => 'lists#index'
  
  get '/about', controller: 'users', action: 'about', as: 'about'

  # Routes for sessions:
  get '/login', controller: 'sessions', action: 'new', as: 'login'
  post '/sessions', controller: 'sessions', action: 'create'
  get '/logout', controller: 'sessions', action: 'destroy', as: "logout"

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
  # get '/categories/:id', controller: 'categories', action: 'show', as: 'category'

  # UPDATE
  get '/categories/:id/edit', controller: 'categories', action: 'edit', as: 'edit_category'
  put '/categories/:id', controller: 'categories', action: 'update'

  # DELETE
  delete '/categories/:id', controller: 'categories', action: 'destroy'
  #------------------------------

  # Routes for the Item resource:
  # CREATE
  get '/lists/:id/items/new', controller: 'items', action: 'new', as: 'new_item'
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

  # Routes for the Collaborator resource: REMOVED FOR NOW, MAY USE IN FUTURE FEATURES
  # CREATE
  # get '/collaborators/new', controller: 'collaborators', action: 'new', as: 'new_collaborator'
  # post '/collaborators', controller: 'collaborators', action: 'create'

  # # READ
  # get '/collaborators', controller: 'collaborators', action: 'index', as: 'collaborators'
  # get '/collaborators/:id', controller: 'collaborators', action: 'show', as: 'collaborator'

  # # UPDATE
  # get '/collaborators/:id/edit', controller: 'collaborators', action: 'edit', as: 'edit_collaborator'
  # put '/collaborators/:id', controller: 'collaborators', action: 'update'

  # # DELETE
  # delete '/collaborators/:id', controller: 'collaborators', action: 'destroy'
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
 
end
