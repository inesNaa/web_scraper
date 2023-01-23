Rails.application.routes.draw do
  resources :real_estates do
    match '/scrape', to: 'real_estates#scrape', via: :post, on: :collection
  end
  root to: 'real_estates#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
