Rails.application.routes.draw do

  namespace :public do
    get 'comments/index'
    get 'comments/show'
    get 'comments/create'
    get 'comments/destroy'
  end
  namespace :public do
    get 'groups/new'
    get 'groups/index'
    get 'groups/show'
    get 'groups/create'
    get 'groups/edit'
    get 'groups/update'
    get 'groups/destroy'
  end
  namespace :public do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/create'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroy'
  end
  devise_for :admin, skip: [:registrations] ,controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
}
  
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }


  root to: 'homes#top'
  get 'homes/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    resources :cupping_notes
  end
  
  
end