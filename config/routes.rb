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
    resources :users, :only => :index
    resources :machines, :only => :index
    post "mod", to: "machines#mod", as: "mod"
  end


  resources :machines
  get "machines/:id/versions", to: "machines#versions", as: "versions"
  post "trace", to: "machines#trace", as: "trace"
  post "mod", to: "machines#mod", as: "mod"
  post "degenerate", to: "machines#degenerate", as: "degenerate"
  post "diff", to: "machines#diff", as: "diff"
  post "nowdiff", to: "machines#nowdiff", as: "nowdiff"
  root 'top#index'
end
