Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard", as: :dashboard

  resources :spots, only: %i[index show] do
    resources :reviews, only: %i[create update]
    resources :experiences, only: %i[create update] do
      resources :comments, only: %i[create update]
    end
  end

  resources :chats, only: %i[show create] do
    resources :messages, only: %i[create]
  end

  resources :reviews, only: %i[destroy]
  resources :experiences, only: %i[destroy]
  resources :comments, only: %i[destroy]
end
