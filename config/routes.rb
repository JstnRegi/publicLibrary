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
end
