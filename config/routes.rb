Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  
  resources :users do
    member do
      get :keeps
      get :entries
    end
  end
  resources :books, only: [:new, :create]
  resources :circles
  resources :circles_users, only: [:create, :destroy]
  resources :microposts, only: [:create]
end
