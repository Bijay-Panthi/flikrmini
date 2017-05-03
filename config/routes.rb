Rails.application.routes.draw do

  root to: "posts#index"

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'

resources :users, :posts # Setting routes for users

end
