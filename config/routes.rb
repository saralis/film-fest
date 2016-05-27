Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  root 'categories#index'

  get '/signup/judge_token_j' => 'users#secret'
  post '/signup/judge/l_step' => 'users#new_judge'
  post '/users/judge' => 'users#create_judge'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'

  get '/films/:id/reviews/new' => 'reviews#new'
  post '/films/:id/reviews' => 'reviews#create'
  get '/films/:id/reviews/edit' => 'reviews#edit'
  post '/films/:id/reviews/edit' => 'reviews#edit'

  put '/reviews/:id/edit' => 'reviews#edit'
  delete '/reviews/:id' => 'reviews#destroy'

  get '/reviews/:id/comments/new' => 'comments#new'
  post '/reviews/:id/comments' => 'comments#create'
  get '/films/reviews/:id/comments/:id/edit' => 'comments#edit'
  patch '/reviews/:id/comments/:id/update' => 'comments#update'
  delete '/comments/:id' => 'comments#destroy'

  get '/films/:id/ratings/new' => 'ratings#new', as: :film_rating
  post '/films/:id/ratings/new' => 'ratings#create'
  post '/films/:id/live' => 'films#live'

  get '/tokens/gen' => 'tokens#new'
  post '/tokens' => 'tokens#create'
  get '/tokens' => 'tokens#show'

  get '/dashboard/users' => 'dashboard#users'
  post '/dashboard' => 'dashboard#make_judge'
  delete '/dashboard' => 'dashboard#destroy_judge'

  get '/dashboard' => 'dashboard#index'
  get '/dashboard/categories' => 'dashboard#categories'
  get '/dashboard/categories/:id' => 'dashboard#category_films'
  post '/dashboard/categories' => 'dashboard#category_winner'

  get '/comments/flagged' => 'comments#flagged'
  delete '/comments' => 'comments#destroy'

  resources :categories, only: [:index, :show]
  resources :films, only: [:index, :show]
  resources :users, only: [:index, :new, :create, :show]
  resources :users do
    collection do
      get :judges

  end
end




















  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
