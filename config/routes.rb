Jcastle4::Application.routes.draw do

  resources :properties

  resources :pages do
    member do
      get 'top100'
      get 'news'
      get 'newsindex'
      patch 'uservisit'
      get 'remove_castle'
    end
  end

#admin_path
  namespace :admin do
    get 'dashboard/index'
    get '', to: 'dashboard#index', as: '/' 
    resources :resources 
    resources :kokuin_matches
    resources :photos do
      collection do
        post 'add_many'
      end
#      member do
#      get 'bulkupdate/:id', to: 'photos#bulkupdate'
#      post 'bulkupdatesave'
#      end
    end

    resources :kokuins
    resources :castles do
      member do
        patch 'add_visit'
      end
    end

  get 'photos/bulkupdate/:id' => 'photos#bulkupdate', :as => 'bulk_update'
  patch 'photos/bulkupdatesave/:id' => 'photos#bulkupdatesave'

  end

  mount RailsAdmin::Engine => '/railsadmin', as: 'rails_admin'


  resources :resources

  resources :photos do
    resources :comments, module: :photos
  end

#  get 'admin/photos-bulk-update' => 'photos#bulk_update', :as => 'admin_images_bulk_update'
#  post 'admin/photos-bulk-update-save' => 'photos#bulk_update_save', :as => 'admin_images_bulk_update_save'

  resources :kokuins

  resources :castles do
    resources :comments, module: :castles
      member do
        get 'uservisit'
        get 'castleslist'
      end
  end
 
  get 'castles/markers/:id' => 'castles#markers'


#  root :to => "home#index"

root to: "home#index"

#  devise_for :users, :controllers => {:registrations => "registrations"}
#  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_for :users, :controllers => {
    registrations: "registrations", 
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users

  resources :rates, only: :update

end

