Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users
	resources :tweets

	resources :user_sessions, only: [:create,:new,:destroy]

	root 'home#index'
end
