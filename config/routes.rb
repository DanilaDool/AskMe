Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, except: [:destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, except: [:new, :index, :show]

  get 'sign_up' => 'users#new'
  get 'log_out' => 'sessions#destroy'
  get 'log_in' => 'sessions#new'
  get '/questions/:id', to: 'questions#destroy'
end
