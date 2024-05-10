Rails.application.routes.draw do

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