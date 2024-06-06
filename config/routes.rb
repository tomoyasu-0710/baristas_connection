Rails.application.routes.draw do
  root to: 'public/homes#top'
  
  get "/search", to: "public/searches#search"

  devise_for :admin, skip: [:registrations] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    resources :posts do
      resources :comments, only: [:create, :destroy]
    end
    resources :tags do
      get 'posts', to: 'posts#search'
    end
    resources :likes, only: [:create, :destroy]
    resources :groups do
      resources :comments, only: [:create, :destroy]
    end
    resources :users do
      get :posts
      get :cupping_notes
      get :groups
      get :likes
    end
    resources :cupping_notes do
      resources :comments, only: [:create, :destroy]
    end
    get 'homes/about'
  end
  end

