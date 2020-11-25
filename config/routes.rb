Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'

  get '/pages/:permalink' => 'pages#show_page', as: :permalink

  resources :products, only: %i[index show] do
    collection do
      get 'vegetarian'
    end
    collection do
      get 'family_friendly'
    end
    collection do
      get 'easy_fast'
    end
    collection do
      get 'meat_veggies'
    end
    collection do
      get 'search'
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :cart, only: %i[create destroy] do
    collection do
      get 'checkout'
    end
  end

  resources :order, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
