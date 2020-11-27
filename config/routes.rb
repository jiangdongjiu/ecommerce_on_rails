Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"

  get "/pages/:permalink" => "pages#show_page", as: :permalink

  resources :products, only: %i[index show] do
    collection do
      get "vegetarian"
    end
    collection do
      get "family_friendly"
    end
    collection do
      get "easy_fast"
    end
    collection do
      get "meat_veggies"
    end
    collection do
      get "search"
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :cart, only: %i[create destroy] do
    collection do
      get "checkout"
    end
  end

  post "/cart/edit", to: "cart#edit", as: "edit_cart"

  scope "/checkout" do
    post "create", to: "stripe_checkout#create", as: "checkout_create"
    get "success", to: "stripe_checkout#success", as: "checkout_success"
    get "cancel", to: "stripe_checkout#cancel", as: "checkout_cancel"
  end
end
