Rails.application.routes.draw do


  root 'mains#index'

  devise_for :users


end
