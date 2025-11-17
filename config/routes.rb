Rails.application.routes.draw do
  get 'events/new'
  get 'events/create'
  get 'group_memberships/create'
  get 'group_memberships/destroy'
  get 'groups/new'
  get 'groups/create'
  get 'groups/index'
  get 'groups/show'
  get 'groups/edit'
  get 'groups/update'
  get 'groups/destroy'
  devise_for :users

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/search', to: 'searches#search'

  resources :groups do
    resources :events, only: [:new, :create, :show]
    resources :group_memberships, only: [:create, :destroy]
  end
  
  resources :events do
  member do
    get :sent
  end
end
  
end
