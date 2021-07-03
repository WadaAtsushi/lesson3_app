Rails.application.routes.draw do
  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'
  
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  get 'logout' => 'users#logout'
  get 'users/signin' => 'users#signin'
  post 'users/create', to: 'users#create', as: "signup"
  get 'users/index' => 'users#index'

  get '/', to: 'posts#top', as: "top"
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  post 'posts/:id/update' => 'posts#update'
  get 'posts/index', to: 'posts#index', as: "posts_index"   #get "url", to: "controllername#method", as: "name"
  get 'posts/event_index' => 'posts#event_index'
  get 'posts/:id/show' => 'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/:id/destroy' => 'posts#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
