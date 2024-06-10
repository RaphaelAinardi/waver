Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/feed", to: "pages#feed", as: :feed
  get "/map", to: "spots#map", as: :map

  resources :spots, only: %i[index show] do
    resources :experiences, only: %i[create update] do
      resources :comments, only: %i[create update]
    end
    resources :favourites, only: %i[create]
    resources :reviews, only: %i[create update]
  end

  resources :chats, only: %i[index show create] do
    resources :messages, only: %i[create]
  end

  resources :users, only: %i[show] do
    member do
      post :set_follow
    end
  end

  resources :comments, only: %i[destroy]
  resources :experiences, only: %i[destroy]
  resources :favourites, only: %i[destroy]
  resources :reviews, only: %i[destroy]
  resources :follows, only: %i[destroy]
end
