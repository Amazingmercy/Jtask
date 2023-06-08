Rails.application.routes.draw do
  resources :tasks
  get 'user/new'
  get 'user/signup' , to: 'user#new', as: 'signup'
  post '/signup', to: 'user#create'
  get 'user/success'

  get 'login', to: 'sessions#new', as: 'login'
  post 'user/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  #delete '/tasks/:id', to: 'tasks#destroy', as: 'task'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "user#home"
end

