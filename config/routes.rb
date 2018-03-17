Rails.application.routes.draw do
  
  resources :genres
  root to: 'home#index'
  
  devise_for :users

  resources :home, only: [] do 
    post :search, on: :collection
  end

  get '/users', to: 'home#users'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
