Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :sessions, only: :create
  get '/login', controller: :sessions, action: :new
  get '/logout', controller: :sessions, action: :destroy

  resource :users, only: :create
  get '/dashboard', controller: :users, action: :show
  get '/registration', controller: :users, action: :new
end
