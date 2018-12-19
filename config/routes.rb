Rails.application.routes.draw do
	root to: "transactions#index"
	resources :transactions
	resources :users, except: [:delete]
end

