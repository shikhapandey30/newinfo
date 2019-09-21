Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :bookings
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products do
    member do
      get 'bookings/new'
    end
  end  
  resources :sub_category_types
  resources :sub_categories
  resources :categories
  resources :addresses
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/failure'

  post 'charges/new' => "charges#new"
  get 'charges/new' => "charges#new"
  get 'charges/create' => 'charges#create'
  post 'order' => "orders#all_order_show"
  get 'orders_history' => "orders#index"
  
  devise_for :users
	root 'home#index'
	get "home/catalog_grid", :to => 'home#catalog_grid'
	get "home/text_page", :to => 'home#text_page'
	get "home/product_page", :to => 'home#product_page'
	get "home/shooping_cart", :to => 'home#shooping_cart'
  get "/update_cart_item_quantity/:type/:cart_item_id" => "carts#update_cart_item_quantity", as: :update_cart_item_quantity
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
  resources :rating_reviews
  # get "/wishlist" => "products#wishlist"
  resources :products do
    get "/wishlist", action: :add_wishlist, as: :add_wishlist
    # get "/cart/:id", action: :add_to_cart, as: :add_to_cart
    get "/cart" => "products#add_to_cart"
  end
  get '/wishlist' => "products#wishlist"
  get '/cart' => "products#cart"
  delete 'remove_wishlist_item/:id' => "products#remove_wishlist", as: :remove_wishlist
  delete 'remove_cart_item/:id' => "products#remove_cart", as: :remove_cart

  # namespace :products do
  #   get "/wishlist", action: :add_wishlist, as: :add_wishlist
  #   get "/cart" => "products#add_to_cart"
  #   # post "/wishlist/:id", action: :add_wishlist, as: :add_wishlist
  # end  
  match '/paytm_payment' => 'paytm#start_payment', via: [:post], :as => :paytm_payment
  match '/confirm_payment' => 'paytm#verify_payment', via: [:post]
  post '/likes' => 'likes#create', as: :like_create
  post '/dislikes' => 'likes#dislike', as: :dislike_create
end
