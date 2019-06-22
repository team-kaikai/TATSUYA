Rails.application.routes.draw do


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


  namespace :admins do
    get 'order_appends/show'
    get 'order_appends/index'
  end


  root 'home#top'


  get 'home/success' => 'home/success'
  get 'home/master' => 'home/master'
  get 'home/select' => 'home/select'

  #mail
  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面

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



  resources :products,   only: [:index, :create, :update, :destroy, :show]do
  	resources :comments,  only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
    resource :carts, only:[:create]
  end
  resources :carts, only:[:destroy]

 resources :home,only:[:top,:success]


resources :end_users,only: [:show,:edit,:update,:destroy] do
 resource :address_menus,only:[:create,:new,:destroy]
 resource :carts,only:[:update,:show]

end
 resources :order_appends, only:[:new, :show, :create, :update]
 resources :order_details, only: [:show]

 # resources :order_appends,only:[:create,:new,:show]

 namespace :admins do
 	resources :products, only: [:show, :new, :edit, :index, :create, :update, :destroy]

	 resources :order_details, only: [:index]

	 resources :artists, only: [:create, :new]

	 resources :end_users, only:[:index,:edit]

	 resources :genres, only: [:create,:new]

	 resources :discs, only: [:create]

	 resources :labels, only: [:create,:new]

   resources :order_appends,only:[:show,:index]
 end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
