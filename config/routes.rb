Rails.application.routes.draw do
  devise_for :admins
  resources :sketches
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sketches#index"
  post '/upvote', to: 'sketches#upvote', as: :upvote

end
