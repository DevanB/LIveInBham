require 'sidekiq/web'

Liveinbham::Application.routes.draw do
	root :to => "units#index"

	get "administrator/index", :as => "admin"
	devise_for :users, :controllers => {:registrations => "registrations"}

	resources :users
	resources :buildings
	resources :categories
	resources :zip_codes
	resources :units

	namespace :api, defaults: {format: 'json'} do
	    namespace :v1 do
	    	resources :units
	    	resources :categories
	    	get "featured", to: 'units#featured'
	    end
	end
	authenticate :user, lambda{ |u| u.has_role? :admin } do
		mount Sidekiq::Web, at: '/sidekiq'
	end
end