Rails.application.routes.draw do
  namespace :api do
		namespace :v1 do
			resources :users, :decisions, :outcomes, :opinions
		end
	end
end
