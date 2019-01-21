Rails.application.routes.draw do
  resources :machines
  post "modify", to: "machines#modify", as: "modify"
  root 'top#index'
end
