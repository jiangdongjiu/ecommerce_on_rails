Rails.application.routes.draw do
  root to: 'products#index'

  resources :products, only: [:index, :show] do
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
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
