Rails.application.routes.draw do

  namespace :admins do
    get 'order_appends/show'
    get 'order_appends/index'
  end
  get 'order_appends/new'
  get 'order_appends/create'
  get 'enduser/show'
  get 'enduser/edit'
  get 'enduser/update'
  get 'enduser/destroy'
  get 'home/top' => 'home#top'
  # namespace :admins do
  #   get 'discs/create'
  # end
  # namespace :admins do
  #   get 'labels/create'
  # end
  # namespace :admins do
  #   get 'genres/create'
  # end
  # namespace :admins do
  #   get 'endusers/index'
  # end
  # namespace :admins do
  #   get 'artists/create'
  # end
  # namespace :admins do
  #   get 'order_details/show'
  #   get 'order_details/index'
  # end
  # namespace :admins do
  #   get 'products/show'
  #   get 'products/new'
  #   get 'products/index'
  #   get 'products/edit'
  # end
  # get 'carts/create'
  # get 'carts/update'
  # get 'carts/destroy'
  # get 'carts/show'
  # get 'favorites/create'
  # get 'favorites/destroy'
  # get 'comments/create'
  # get 'comments/destroy'
  # get 'address_menus/create'
  # get 'address_menus/show'
  # get 'address_menus/destroy'
  # get 'home/top'
  # get 'home/success'
  # get 'products/index'
  # get 'products/create'
  # get 'products/update'
  # get 'products/destroy'
  devise_for :admins,controllers: {
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords',
  	registrations: 'admins/registrations'
  }



  devise_for :end_users, controllers: {
  	sessions: 'end_users/sessions',
  	passwords: 'end_users/passwords',
  	registrations: 'end_users/registrations'
  }

  resources :products,   only: [:index, :create, :update, :destroy] do
  	resource :comments,  only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

 resources :home,only:[:top,:success]

 resources :address_menus,only:[:create,:show,:destroy]

 resources :carts,only:[:create,:update,:destroy,:show]

 resources :order_details, only: [:show]

 # resources :order_appends,only:[:create,:new,:show]

 namespace :admins do
 	resources :products, only: [:show, :new, :edit, :index]

	 resources :order_details, only: [:index]

	 resources :artists, only: [:create]

	 resources :end_users, only: [:index,:edit]

	 resources :genres, only: [:create]

	 resources :discs, only: [:create]

	 resources :labels, only: [:create]

   resources :order_appends,only:[:show,:index]
 end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
