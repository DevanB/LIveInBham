Liveinbham::Application.routes.draw do
	root :to => "units#index"
	get "administrator/index", :as => "admin"
	devise_for :users, :controllers => {:registrations => "registrations"}

	resources :users
	resources :buildings
	resources :categories
	resources :zip_codes
	resources :units
end