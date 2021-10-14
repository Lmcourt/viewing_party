Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :sessions, only: :create
  get '/login', controller: :sessions, action: :new
  delete '/logout', controller: :sessions, action: :destroy

  resource :users, only: :create
  get '/dashboard', controller: :users, action: :show
  get '/registration', controller: :users, action: :new

  resources :movies, only: :index
  scope :movies do
    resource :details, only: :show
  end

  resources :parties, only: %i[new create]

  get '/discover', to: 'discovers#index'
end
