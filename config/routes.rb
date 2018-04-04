Rails.application.routes.draw do


  get 'moods/index'

  get 'moods/create'

  root 'mains#index'

  devise_for :users


end
