Rails.application.routes.draw do

  scope module: :public do
    resources :comments
    # get 'comments/index'
    # get 'comments/show'
    # get 'comments/create'
    # get 'comments/destroy'
  end
  scope module: :public do
    resources :groups
    # get 'groups/new'
    # get 'groups/index'
    # get 'groups/show'
    # get 'groups/create'
    # get 'groups/edit'
    # get 'groups/update'
    # get 'groups/destroy'
  end
  scope module: :public do
    resources :users
    # get 'users/index'
    # get 'users/show'
    # get 'users/edit'
    # get 'users/update'
    # get 'users/destroy'
  end
  scope module: :public do
    resources :posts
    # get 'posts/new'
    # get 'posts/index'
    # get 'posts/show'
    # get 'posts/create'
    # get 'posts/edit'
    # get 'posts/update'
    # get 'posts/destroy'
  end
  
  scope module: :public do
    resources :cupping_notes
  end
  
  
  devise_for :admin, skip: [:registrations] ,controllers: {
  sessions: "admin/sessions"
}
  
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  root to: 'homes#top'
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  
end