Rails.application.routes.draw do
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
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/failure'
  devise_for :users
	root 'home#index'
	get "home/catalog_grid", :to => 'home#catalog_grid'
	get "home/text_page", :to => 'home#text_page'
	get "home/product_page", :to => 'home#product_page'
	get "home/shooping_cart", :to => 'home#shooping_cart'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/auth/:provider/callback', :to => 'sessions#create', via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
  resources :rating_reviews
  get "/wishlist" => "products#wishlist"

  namespace :products do
    post "/wishlist/:id", action: :add_wishlist, as: :add_wishlist
  end  
  match '/paytm_payment' => 'paytm#start_payment', via: [:post], :as => :paytm_payment
  match '/confirm_payment' => 'paytm#verify_payment', via: [:post]
  post '/likes' => 'likes#create', as: :like_create
  post '/dislikes' => 'likes#dislike', as: :dislike_create
end
