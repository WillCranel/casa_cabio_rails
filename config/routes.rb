Rails.application.routes.draw do
	root to: "transactions#index"
	resources :transactions
	get '/list', to: 'transactions#show_all'
	resources :users, except: [:delete]
end

