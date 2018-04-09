Rails.application.routes.draw do
  api_version(module: 'V1', path: { value: 'v1' }) do
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
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
