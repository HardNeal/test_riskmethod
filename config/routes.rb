Rails.application.routes.draw do
  root 'homepages#index'
  devise_for :users

  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
