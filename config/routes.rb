Jcastle4::Application.routes.draw do
  root :to => "home#index"

#  devise_for :users, :controllers => {:registrations => "registrations"}
#  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

	devise_for :users, :controllers => {
		registrations: "registrations", 
		omniauth_callbacks: "users/omniauth_callbacks"
	}

  resources :users
end