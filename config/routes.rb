Rails.application.routes.draw do
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
end
