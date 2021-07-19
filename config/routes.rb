Rails.application.routes.draw do
  post 'comments/:post_id/create', to: 'comments#create',  as: 'comment_create'
  
  post           'event/search', to: 'posts#event_search',    as:'event_search'

  post  'likes/:post_id/create', to: 'likes#create',          as:'like_create'
  post 'likes/:post_id/destroy', to: 'likes#destroy',         as:'like_destroy'
  
  get                   'login', to: 'users#login_form',      as: 'login'
  post              'userlogin', to: 'users#login',           as: 'user_login'
  get                  'logout', to: 'users#logout',          as: 'logout'
  get            'users/signin', to: 'users#signin',          as: 'users_signin'
  post           'users/create', to: 'users#create',          as: "signup"
  get             'users/index', to: 'users#index',           as: 'user_index'

  get                       '/', to: 'posts#top',             as: "top"
  get                'posts/new',to: 'posts#new',             as: 'post_new'
  post           'posts/create', to: 'posts#create',          as: 'create_post'
  patch      'posts/:id/update', to: 'posts#update',          as: 'edit_post'
  get             'posts/index', to: 'posts#index',           as: 'posts_index'   #get "url", to: "controllername#method", as: "name"
  get       'posts/event_index', to: 'posts#event_index',     as: 'event_index'
  get          'posts/:id/show', to: 'posts#show',            as: 'posts_shouserw'
  get          'posts/:id/edit', to: 'posts#edit',            as: 'post_edit'
  get       'posts/:id/destroy', to: 'posts#destroy',         as: 'post_destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
