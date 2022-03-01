Rails.application.routes.draw do
  resources :articles, only: [:show]
  resources :posts 
  root 'pages#home'
  get 'about', to: 'pages#about'
end
