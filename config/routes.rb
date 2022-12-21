Rails.application.routes.draw do
  resources:books
  devise_for :users
  resources:users, only:[:show,:edit,:index]
  root to: "homes#top"
  get 'homes/about' =>'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'

  # get 'user/show'
  # get 'user/edit'


end
