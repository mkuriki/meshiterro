Rails.application.routes.draw do
  
  
  resources :users, only: [:show, :edit]
  get 'homes/top'
  get 'homes/about', as: 'about'
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
