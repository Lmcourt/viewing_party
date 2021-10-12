Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :sessions, only: :create
  get '/login', controller: :sessions, action: :new
  get '/logout', controller: :sessions, action: :destroy

  resource :users, only: :create
  get '/profile', controller: :users, action: :show
  get '/register', controller: :users, action: :new
end
