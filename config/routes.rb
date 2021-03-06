# -*- encoding : utf-8 -*-
Rails.application.routes.draw do

  get 'settings' => "settings#index"

  resources :logs, :only => [:new, :create]
  resources :messages do
    member do
      put :mark_sent
    end
  end
  resources :users, :only => [:create, :update] do
    collection do
      put :change_pass
      put :change_name
    end
  end
  resources :apps, :only => [:create, :update] do
    member do
      put :switch
    end
  end

  get 'app/settings' => "apps#settings"

  get 'signin' => 'session#signin'
  get 'signup' => 'session#signup'
  post 'signin' => 'session#signin'
  post 'signup' => 'session#signup'
  delete 'sign_out' => 'session#sign_out'

  get 'dashboard' => "dashboard#index"
  get 'about' => 'welcome#about'
  get 'jobs' => 'welcome#jobs'
  get 'media' => 'welcome#media'

  put 'switch_app' => "app#switch_app"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
