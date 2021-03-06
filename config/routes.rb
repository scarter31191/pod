Rails.application.routes.draw do
  
  root 'sessions#welcome'

  get '/sign-up' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :podcasts, only: [:index, :new, :create]
  
  resources :topics do 
    resources :podcasts, shallow: true
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
