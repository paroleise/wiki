Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end


  devise_for :administrators, controllers: {
    sessions: 'administrators/sessions',
  }, path: 'sakuraiyushi'


  namespace :sakuraiyushi do
    root "top#index"
    resources :users
    resources :machines
    post "mod", to: "machines#mod", as: "mod"
    get "history", to: "machines#history", as: "history"
  end


  resources :machines
  get "machines/:id/versions", to: "machines#versions", as: "versions"
  post "trace", to: "machines#trace", as: "trace"
  post "mod", to: "machines#mod", as: "mod"
  post "degenerate", to: "machines#degenerate", as: "degenerate"
  root 'top#index'
end
