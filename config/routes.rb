Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users,only: [:show,:index,:edit,:update] do
   resource :relationships, only: [:create, :destroy]
   member do
      get 'followers'
      get 'followings'
    end

  	end
  root 'homes#top'
  get 'home/about' => 'homes#about'
  
  
  	
  	
end
