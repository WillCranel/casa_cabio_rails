Rails.application.routes.draw do
	root to: "home#index"
	resources :transactions, except: [:index]
	resources :users, only: [:show, :create, :new]
end
