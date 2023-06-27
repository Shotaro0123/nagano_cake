Rails.application.routes.draw do

 root to:"public/homes#top"

  get '' => 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'items' => 'public/items#index'
  get 'cart_items' => 'public/cart_items#index'

  get 'customers/my_page' => 'public/customers#show'
  get 'customers/information/edit' => 'public/customers#edit'
  patch 'customers/information/edit'  => 'public/customers#update'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw'

  get 'addresses' => 'public/addresses#index'

  resources :orders, only: [:index]

  #以下adminコントローラのルーティング
  namespace :admin do
  get '' => 'homes#top'
  get 'customers' => 'customers#index'

  resources :items, only: [:index, :new, :create]
 end

  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: "public/sessions"
  }
  devise_for :admin, skip: [:registrations,:passwords], controllers:{
   sessions:"admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
