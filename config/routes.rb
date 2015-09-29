Rails.application.routes.draw do

  devise_for :users, :path => 'auth'
  devise_scope :user do
    authenticated :user do
      root :to => 'welcome#index'
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :areas
  resources :customer_companies
  resources :menu_options
  resources :permits
  resources :roles
  resources :users
  resources :workplaces


  # beliefs routes
  get '/companies_info/index', to: 'companies_info#belief', as: 'companies_info_belief'
  get '/beliefs/:id/edit', to: 'beliefs#show', as: 'belief'
  get '/beliefs/new', to: 'beliefs#new', as: 'new_belief'
  get '/beliefs/edit', to: 'beliefs#edit', as: 'edit_belief'
  get '/beliefs/edit', to: 'beliefs#edit', as: 'beliefs'
  post '/beliefs/edit', to: 'beliefs#create'
  put '/beliefs/:id/edit', to: 'beliefs#update'
  patch '/beliefs/:id/edit', to: 'beliefs#update'
  delete '/beliefs/:id/edit', to: 'beliefs#destroy'

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

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
