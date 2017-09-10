Rails.application.routes.draw do
  namespace :api do
		namespace :v1 do
			resources :users, :decisions, :outcomes, :opinions
      # post '/sessions', to: 'sessions#create'
      # get '/sessions/current_user', to: 'sessions#show'

      get 'current_user', to: 'sessions#show'
      post 'signup', to: 'users#create'
      post 'login', to: 'sessions#create'
		end
	end
end
