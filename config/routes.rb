Rails.application.routes.draw do
  root 'users#show'

  resources :users
  resources :questions
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'show' => 'users#show'

  # Defines the root path route ("/")
  # root "articles#index"
end
