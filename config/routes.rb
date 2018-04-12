Rails.application.routes.draw do

  root 'mains#index'

  get '/search' => 'search#index'

  resources :moods

  devise_for :users


end
