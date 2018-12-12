Rails.application.routes.draw do
	root to: "home#index"
	resources :transactions, only: [:show, :new, :create]
end
