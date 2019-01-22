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
  end


  resources :machines
  post "modify", to: "machines#modify", as: "modify"
  root 'top#index'
end
