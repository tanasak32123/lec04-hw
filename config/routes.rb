Rails.application.routes.draw do
  get '/', to: 'main#home'
  get 'main/test'
  post 'main/test'
  post 'main/calculate'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
