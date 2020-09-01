Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :item_purchases do
      resources :shipping_addresses
    end
  end
  
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
