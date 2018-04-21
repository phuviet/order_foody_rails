Rails.application.routes.draw do
  api_version(module: 'V1', path: { value: 'v1' }) do
    resources :profile, only: %i[index update] do
      resources :password, only: :update
    end
    resources :orders, only: %i[create index show]
    resources :system_config, only: :index
    resources :votes, only: :create
    resources :comments, only: :create
    resources :auths, only: :create
    resource :auths, only: :destroy
    resources :shop_detail, only: :index
    resources :categories, only: :index do
      resources :products, only: :index, controller: 'categories/products'
    end
    resources :products, only: %i[index show] do
      collection do
        resources :newest, only: :index, controller: 'products/newest'
        resources :sellers, only: :index, controller: 'products/sellers'
        resources :watched, only: :index, controller: 'products/watched'
        resources :pointer, only: :index, controller: 'products/pointer'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
