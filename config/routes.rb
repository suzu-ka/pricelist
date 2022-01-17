Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users, only: [:show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  Rails.application.routes.draw do
    resources :items do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      collection do
       get 'top'
      end
    end
    root to: 'items#top'

    post 'items/food' => 'items#food'
    post 'items/life' => 'items#life'
    post 'items/fashion' => 'items#fashion'
    post 'items/toy' => 'items#toy'
    post 'items/character' => 'items#character'
    post 'items/others' => 'items#others'
  end
end