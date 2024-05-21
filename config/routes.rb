Rails.application.routes.draw do
  root to: 'public/homes#top'

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
    resources :posts
    resources :likes, only: [:create, :destroy]
    resources :comments
    resources :groups
    resources :users do
      get :posts
      get :cupping_notes
      get :groups
      get :likes
    end
    resources :cupping_notes
    get 'homes/about'
  end
end