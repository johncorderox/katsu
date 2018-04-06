Rails.application.routes.draw do

  root 'mains#index'

  resources :moods

  devise_for :users


end
