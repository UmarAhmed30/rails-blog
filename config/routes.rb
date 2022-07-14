Rails.application.routes.draw do
  root 'pages#home'
  # Get into pages controller and look for home action

  # If we don't wanna have an explicit route for home, we can do
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'

  # get 'pages/home'
  # get 'pages/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
