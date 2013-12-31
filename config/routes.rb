Liveinbham::Application.routes.draw do
  resources :zip_codes

	root :to => "home#index"
	get "administrator/index", :as => "admin"
	devise_for :users, :controllers => {:registrations => "registrations"}
  
	resources :users
	resources :buildings
	resources :categories
end