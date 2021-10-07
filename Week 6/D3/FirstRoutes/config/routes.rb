Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create', as: 'user'
  patch '/users/:id', to: 'users#update'
  put '/users/:id', to: 'users#update'
  get '/users/new', to: "users#new"
  get '/users/:id/edit', to: "users#edit"
  delete '/users/:id', to: "users#destroy"
end
