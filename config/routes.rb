Rails.application.routes.draw do
  root "users#index"
  resources :freindships
  resources :users
  resource :session, only: [:new, :create, :destroy]
  get "follow" => "freindships#create"
  get "accept" => "freindships#update"
  get "unfollow" => "freindships#destroy"
end
