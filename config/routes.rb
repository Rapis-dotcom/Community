Rails.application.routes.draw do
devise_for :users
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "homes#top"
 get 'home/about' => 'homes#about'
 get '/users/:id', to: 'users#show', as: 'user'
 get '/mypage',to: 'users#mypage', as: 'mypage'

    resources :users, only: [:new, :create, :show, :edit, :index, :update, :destroy]
    resources :posts, only: [:new, :create, :show, :edit, :index, :update, :destroy] 
    resources :communities, only:  [:new, :create, :show, :edit, :index, :update, :destroy]
    resources :comments, only:  [:new, :create, :show, :edit, :index, :update, :destroy]
    resources :admin, only:  [:new, :create, :show, :edit, :index, :update, :destroy]
end
