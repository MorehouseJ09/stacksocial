Stacksocial::Application.routes.draw do

  match "/auth/:provider/callback" => 'sessions#create', :as => :create_user

  match "/auth/failure" => "sessions#failure" 

  match "/logout" => "sessions#destroy", :as => :logout

  # create basic login element for creating new sessions -- this goes through our twitter / auth elements
  match "/login" => "sessions#new", :as => :login 

  # app url base
  match "/app" => "app#index", :as => :app

  # create namespace for api calls etc!
  # all angular access goes through here
  namespace :api do

  	# allow for user information updating etc. Grab users and friends etc
  	resources :user

  	# create / get tweets
  	resources :tweet

    # messaging between different elements
    resources :message, :only => [:create]

  end

  # basic home page for application
  root :to => 'home#index'

end
