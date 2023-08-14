Rails.application.routes.draw do

 scope module: :public do
 root to:"homes#top"

  get '' => 'homes#top'
  get 'about' => 'homes#about'
  get 'items' => 'items#index'
  get 'items/:id' => 'items#show', as: 'item'

  get 'customers/my_page' => 'customers#show'
  get 'customers/information/edit' => 'customers#edit'
  patch 'customers/information/edit'  => 'customers#update'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw'
  get 'addresses' => 'addresses#index'
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'

  resources :items, only: [:new, :create]
  resources :orders, only: [:index]
  resources :cart_items, only: [:index, :update, :create, :destroy]
 end
  #以下adminコントローラのルーティング
  namespace :admin do
  get '' => 'homes#top'
  resources :customers, only: [:index, :show, :edit, :update]

  resources :items, only: [:index, :new, :create, :show, :edit, :update]
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
