Rails.application.routes.draw do

 root to:"public/homes#top"

  get '/' => 'public/homes#top'
  get 'about' => 'public/homes#about'
  get '/items' => 'public/items#index'
  get '/cart_items' => 'public/cart_items#index'

  get 'admin' => 'admin/homes#top'
  get 'admin/items' => 'admin/items#index'
  get 'admin/customers' => 'admin/customers#index'

  get '/items' => 'public/items#index'
  get '/customers/my_page' => 'public/customers#show'
  resources :items, only:[:index]

  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: "public/sessions"
  }
  devise_for :admin, skip: [:registrations,:passwords], controllers:{
   sessions:"admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
