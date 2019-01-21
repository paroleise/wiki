Rails.application.routes.draw do
  resources :machines
  root 'top#index'
end
