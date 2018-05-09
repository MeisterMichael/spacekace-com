Rails.application.routes.draw do


	resources :admin, only: :index


	devise_scope :user do
		get '/forgot' => 'passwords#new', as: 'forgot'
		get '/login' => 'sessions#new', as: 'login'
		get '/logout' => 'sessions#destroy', as: 'logout'
		get '/register' => 'registrations#new', as: 'register'
	end

	# @todo uncomment after migration
	devise_for :users, :controllers => { :registrations => 'registrations', :sessions => 'sessions', :passwords => 'passwords' }
	# more recommended devise options { :omniauth_callbacks => 'oauth' }

	mount SwellMedia::Engine, :at => '/'

end
