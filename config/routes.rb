Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new, :edit, :show, :index, :create, :update, :destroy] do
    resources :post_comments, only: [:create]
  end
  resources :users, only: [:edit, :show,:update, :index]
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
