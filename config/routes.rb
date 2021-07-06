Rails.application.routes.draw do
  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'
  
  get 'login',to: 'users#login_form', as: 'login'
  post 'userlogin',to:'users#login',as: "user_login"
  get 'logout', to: 'users#logout', as: 'logout'
  get 'users/signin', to: 'users#signin', as: 'users_signin'
  post 'users/create', to: 'users#create', as: "signup"
  get 'users/index', to: 'users#index', as: 'user_index'

  get '/', to: 'posts#top', as: "top"
  get 'posts/new',to: 'posts#new', as: 'post_new'
  post 'posts/create', to: 'posts#create', as: 'new_post'
  patch 'posts/:id/update', to: 'posts#update', as: 'edit_post'
  get 'posts/index', to: 'posts#index', as: 'posts_index'   #get "url", to: "controllername#method", as: "name"
  get 'posts/event_index', to: 'posts#event_index', as: 'event_index'
  get 'posts/:id/show' => 'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/:id/destroy' => 'posts#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
