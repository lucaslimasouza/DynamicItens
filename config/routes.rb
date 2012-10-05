DynamicItens::Application.routes.draw do
  
  devise_for :admins 

	root to: "admins/items#index"

	namespace :admins do
		resources :items, only: [:create,:new,:index] do
			collection do	
				get "update_position"
				get "sort_by_name"
			end			
		end
	end

end
