Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/feed", to: "pages#feed", as: :feed

  resources :spots, only: %i[index show] do
    resources :experiences, only: %i[create update] do
      resources :comments, only: %i[create update]
    end
    resources :favourites, only: %i[create]
    resources :reviews, only: %i[create update]
  end

  resources :chats, only: %i[show create] do
    resources :messages, only: %i[create]
  end

  resources :follows, only: %i[create destroy]

  resources :comments, only: %i[destroy]
  resources :experiences, only: %i[destroy]
  resources :favourites, only: %i[destroy]
  resources :reviews, only: %i[destroy]
end
