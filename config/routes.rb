Paykido::Application.routes.draw do
  get "dashboard/index"

  authenticated :user do
    root :to => 'dashboard#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only => [:show, :index]


end
