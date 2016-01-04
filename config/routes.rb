Rails.application.routes.draw do
  resources :users
  resources :posts
  resources :cities


=begin

  Prefix Verb   URI Pattern                Controller#Action
    users GET    /users(.:format)           users#index
          POST   /users(.:format)           users#create
 new_user GET    /users/new(.:format)       users#new
edit_user GET    /users/:id/edit(.:format)  users#edit
     user GET    /users/:id(.:format)       users#show
          PATCH  /users/:id(.:format)       users#update
          PUT    /users/:id(.:format)       users#update
          DELETE /users/:id(.:format)       users#destroy
    posts GET    /posts(.:format)           posts#index
          POST   /posts(.:format)           posts#create
 new_post GET    /posts/new(.:format)       posts#new
edit_post GET    /posts/:id/edit(.:format)  posts#edit
     post GET    /posts/:id(.:format)       posts#show
          PATCH  /posts/:id(.:format)       posts#update
          PUT    /posts/:id(.:format)       posts#update
          DELETE /posts/:id(.:format)       posts#destroy
   cities GET    /cities(.:format)          cities#index
          POST   /cities(.:format)          cities#create
 new_city GET    /cities/new(.:format)      cities#new
edit_city GET    /cities/:id/edit(.:format) cities#edit
     city GET    /cities/:id(.:format)      cities#show
          PATCH  /cities/:id(.:format)      cities#update
          PUT    /cities/:id(.:format)      cities#update
          DELETE /cities/:id(.:format)      cities#destroy
=end

end
