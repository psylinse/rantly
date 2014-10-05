Rails.application.routes.draw do
  root :to => "home#index"

  resource :dashboard, :only => [:show]
  resource :session, :only => [:new, :create, :destroy]
  resources :users, :only => [:new, :create, :edit, :update]
  resources :rants, :only => [:new, :create, :destroy]
end
