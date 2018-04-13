Rails.application.routes.draw do

  root 'mains#index'

  get '/search' => 'search#index'

  resources :moods
  resources :posts

  devise_for :users
    devise_scope :user do
    get '/users/:id' => 'users/registrations#show'
  end

end
