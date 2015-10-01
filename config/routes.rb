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
  get '/companies_info/belief', to: 'companies_info#belief', as: 'companies_info_belief'
  get '/beliefs/:id/edit', to: 'beliefs#show', as: 'belief'
  get '/beliefs/new', to: 'beliefs#new', as: 'new_belief'
  get '/beliefs/edit', to: 'beliefs#edit', as: 'edit_belief'
  get '/beliefs/edit', to: 'beliefs#edit', as: 'beliefs'
  post '/beliefs/edit', to: 'beliefs#create'
  put '/beliefs/:id/edit', to: 'beliefs#update'
  patch '/beliefs/:id/edit', to: 'beliefs#update'
  delete '/beliefs/:id/edit', to: 'beliefs#destroy'

  # external_context routes
  get '/companies_info/external_context', to: 'companies_info#external_context', as: 'companies_info_external_context'
  get '/external_contexts/:id/edit', to: 'external_contexts#show', as: 'external_context'
  get '/external_contexts/new', to: 'external_contexts#new', as: 'new_external_context'
  get '/external_contexts/edit', to: 'external_contexts#edit', as: 'edit_external_context'
  get '/external_contexts/edit', to: 'external_contexts#edit', as: 'external_contexts'
  post '/external_contexts/edit', to: 'external_contexts#create'
  put '/external_contexts/:id/edit', to: 'external_contexts#update'
  patch '/external_contexts/:id/edit', to: 'external_contexts#update'
  delete '/external_contexts/:id/edit', to: 'external_contexts#destroy'

  # global_strategy routes
  get '/companies_info/global_strategy', to: 'companies_info#global_strategy', as: 'companies_info_global_strategy'
  get '/global_strategies/:id/edit', to: 'global_strategies#show', as: 'global_strategy'
  get '/global_strategies/new', to: 'global_strategies#new', as: 'new_global_strategy'
  get '/global_strategies/edit', to: 'global_strategies#edit', as: 'edit_global_strategy'
  get '/global_strategies/edit', to: 'global_strategies#edit', as: 'global_strategies'
  post '/global_strategies/edit', to: 'global_strategies#create'
  put '/global_strategies/:id/edit', to: 'global_strategies#update'
  patch '/global_strategies/:id/edit', to: 'global_strategies#update'
  delete '/global_strategies/:id/edit', to: 'global_strategies#destroy'

  # growth_vector routes
  get '/companies_info/growth_vector', to: 'companies_info#growth_vector', as: 'companies_info_growth_vector'
  get '/growth_vectors/:id/edit', to: 'growth_vectors#show', as: 'growth_vector'
  get '/growth_vectors/new', to: 'growth_vectors#new', as: 'new_growth_vector'
  get '/growth_vectors/edit', to: 'growth_vectors#edit', as: 'edit_growth_vector'
  get '/growth_vectors/edit', to: 'growth_vectors#edit', as: 'growth_vectors'
  post '/growth_vectors/edit', to: 'growth_vectors#create'
  put '/growth_vectors/:id/edit', to: 'growth_vectors#update'
  patch '/growth_vectors/:id/edit', to: 'growth_vectors#update'
  delete '/growth_vectors/:id/edit', to: 'growth_vectors#destroy'

  # growth_vector_detail routes
  get '/companies_info/growth_vector_detail', to: 'companies_info#growth_vector_detail', as: 'companies_info_growth_vector_detail'
  get '/growth_vector_details/:id/edit', to: 'growth_vector_details#show', as: 'growth_vector_detail'
  get '/growth_vector_details/new', to: 'growth_vector_details#new', as: 'new_growth_vector_detail'
  get '/growth_vector_details/edit', to: 'growth_vector_details#edit', as: 'edit_growth_vector_detail'
  get '/growth_vector_details/edit', to: 'growth_vector_details#edit', as: 'growth_vector_details'
  post '/growth_vector_details/edit', to: 'growth_vector_details#create'
  put '/growth_vector_details/:id/edit', to: 'growth_vector_details#update'
  patch '/growth_vector_details/:id/edit', to: 'growth_vector_details#update'
  delete '/growth_vector_details/:id/edit', to: 'growth_vector_details#destroy'

  # internal_context routes
  get '/companies_info/internal_context', to: 'companies_info#internal_context', as: 'companies_info_internal_context'
  get '/internal_contexts/:id/edit', to: 'internal_contexts#show', as: 'internal_context'
  get '/internal_contexts/new', to: 'internal_contexts#new', as: 'new_internal_context'
  get '/internal_contexts/edit', to: 'internal_contexts#edit', as: 'edit_internal_context'
  get '/internal_contexts/edit', to: 'internal_contexts#edit', as: 'internal_contexts'
  post '/internal_contexts/edit', to: 'internal_contexts#create'
  put '/internal_contexts/:id/edit', to: 'internal_contexts#update'
  patch '/internal_contexts/:id/edit', to: 'internal_contexts#update'
  delete '/internal_contexts/:id/edit', to: 'internal_contexts#destroy'

  # market_context routes
  get '/companies_info/market_context', to: 'companies_info#market_context', as: 'companies_info_market_context'
  get '/market_contexts/:id/edit', to: 'market_contexts#show', as: 'market_context'
  get '/market_contexts/new', to: 'market_contexts#new', as: 'new_market_context'
  get '/market_contexts/edit', to: 'market_contexts#edit', as: 'edit_market_context'
  get '/market_contexts/edit', to: 'market_contexts#edit', as: 'market_contexts'
  post '/market_contexts/edit', to: 'market_contexts#create'
  put '/market_contexts/:id/edit', to: 'market_contexts#update'
  patch '/market_contexts/:id/edit', to: 'market_contexts#update'
  delete '/market_contexts/:id/edit', to: 'market_contexts#destroy'

  # opportunity routes
  get '/companies_info/opportunity', to: 'companies_info#opportunity', as: 'companies_info_opportunity'
  get '/opportunities/:id/edit', to: 'opportunities#show', as: 'opportunity'
  get '/opportunities/new', to: 'opportunities#new', as: 'new_opportunity'
  get '/opportunities/edit', to: 'opportunities#edit', as: 'edit_opportunity'
  get '/opportunities/edit', to: 'opportunities#edit', as: 'opportunities'
  post '/opportunities/edit', to: 'opportunities#create'
  put '/opportunities/:id/edit', to: 'opportunities#update'
  patch '/opportunities/:id/edit', to: 'opportunities#update'
  delete '/opportunities/:id/edit', to: 'opportunities#destroy'

  # risks routes
  get '/companies_info/risk', to: 'companies_info#risk', as: 'companies_info_risk'
  get '/risks/:id/edit', to: 'risks#show', as: 'risk'
  get '/risks/new', to: 'risks#new', as: 'new_risk'
  get '/risks/edit', to: 'risks#edit', as: 'edit_risk'
  get '/risks/edit', to: 'risks#edit', as: 'risks'
  post '/risks/edit', to: 'risks#create'
  put '/risks/:id/edit', to: 'risks#update'
  patch '/risks/:id/edit', to: 'risks#update'
  delete '/risks/:id/edit', to: 'risks#destroy'

  # social_responsability routes
  get '/companies_info/social_responsability', to: 'companies_info#social_responsability', as: 'companies_info_social_responsability'
  get '/social_responsabilities/:id/edit', to: 'social_responsabilities#show', as: 'social_responsability'
  get '/social_responsabilities/new', to: 'social_responsabilities#new', as: 'new_social_responsability'
  get '/social_responsabilities/edit', to: 'social_responsabilities#edit', as: 'edit_social_responsability'
  get '/social_responsabilities/edit', to: 'social_responsabilities#edit', as: 'social_responsabilities'
  post '/social_responsabilities/edit', to: 'social_responsabilities#create'
  put '/social_responsabilities/:id/edit', to: 'social_responsabilities#update'
  patch '/social_responsabilities/:id/edit', to: 'social_responsabilities#update'
  delete '/social_responsabilities/:id/edit', to: 'social_responsabilities#destroy'

  # sustainability routes
  get '/companies_info/sustainability', to: 'companies_info#sustainability', as: 'companies_info_sustainability'
  get '/sustainabilities/:id/edit', to: 'sustainabilities#show', as: 'sustainability'
  get '/sustainabilities/new', to: 'sustainabilities#new', as: 'new_sustainability'
  get '/sustainabilities/edit', to: 'sustainabilities#edit', as: 'edit_sustainability'
  get '/sustainabilities/edit', to: 'sustainabilities#edit', as: 'sustainabilities'
  post '/sustainabilities/edit', to: 'sustainabilities#create'
  put '/sustainabilities/:id/edit', to: 'sustainabilities#update'
  patch '/sustainabilities/:id/edit', to: 'sustainabilities#update'
  delete '/sustainabilities/:id/edit', to: 'sustainabilities#destroy'

  # default
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
