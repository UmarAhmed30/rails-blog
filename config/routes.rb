Rails.application.routes.draw do
  get 'search', to: 'search#index'
  get 'users/profile'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'u/:id', to: 'users#profile', as: 'user'

  # /posts/1/comments/4

  resources :posts do
    resources :comments
  end
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
