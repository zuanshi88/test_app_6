Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  resources :posts 

  # could restrict with a hash of only: [show, edit]
  #expose all REST-ful routes-- representational state transfer
  # basically a mapping of the HTTP verbs(get, post, put/patch, delete)
  # to CRUD actions in Rails App.
  #HTTP verbs front end requests -- CRUD actions backend responses.
  #frontend could be anything just as long as the HTTP verbs are being
  #translated into the appropriate/correct CRUD action.

end
