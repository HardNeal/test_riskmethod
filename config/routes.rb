Rails.application.routes.draw do
  root 'homepages#index'
  devise_for :users

  resources :movies
  resources :homepages
  post "create_rating" => "movies#create_rating", as: "create_rating"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
