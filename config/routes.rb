Rails.application.routes.draw do
  resources :marvin_callbacks

  root to: 'visitors#index'
  devise_for :users, :path_prefix => 'dev'
  resources :users

  put '/marvin_callbacks', to: 'marvin_callbacks#callback_handler'
end
