Rails.application.routes.draw do
  resources :friends
  resources :shots
  resources :holes_results
  resources :rounds
  resources :holes_overviews
  resources :golf_courses
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
