Rails.application.routes.draw do
  #serves users index.html
  root to: 'users#index'
  get '/users', to: 'users#index', as: 'users'

  #handles users signing up then viewing their profile
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'

  #handles users signing in
  get '/sign_in', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  #handles users logging out
  delete '/sessions', to: 'sessions#destroy'

  #serves up a list of libraries
  get '/libraries', to: 'libraries#index'

  #create new library
  get '/libraries/new', to: 'libraries#new', as: 'new_library'
  post '/libraries', to: 'libraries#create'

  #serves up a list of users to a library
  get '/users/:user_id/libraries', to: 'library_users#index', as: 'user_libraries'
  post "/libraries/:library_id/users", to: "library_users#create", as: "library_users"
end
