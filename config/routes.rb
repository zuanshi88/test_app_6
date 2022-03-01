Rails.application.routes.draw do
  resources :articles
  resources :posts 
  root 'articles#index'
  get 'about', to: 'pages#about'
end
