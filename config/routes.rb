Liveinbham::Application.routes.draw do
  resources :categories

  root :to => "home#index"

  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :users
  resources :buildings
	resources :zip_codes
end