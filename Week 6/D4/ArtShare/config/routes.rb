Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :destroy, :index, :show, :update]
  resources :artworks, only: [:create, :destroy, :show, :update]
  resources :artwork_shares, only: [:create, :destroy]

  resources :users do
    resources :artworks, only: [:index]
  end

  resources :comments, only: [:create, :destroy, :index]

end
