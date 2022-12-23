Rails.application.routes.draw do
  resources:books, only:[:index,:show,:create,:edit,:destroy]
  devise_for :users
  resources:users, only:[:new,:index,:show,:edit,:create]
  root to: "homes#top"
  get 'homes/about' =>'homes#about'
  resources:post_images, only:[:new,:index,:show,:create]
  get'books/:id/edit'=>'books#edit', as:'edit_book'
  patch 'books/:id' => 'books#update', as:'update_book'
  delete'books/:id'=>'books#destroy', as:'destroy_book'

  get 'users/:id/edit'=>'users#edit', as:'edit_user'
  patch 'users/:id'=>'users#update', as:'update_user'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'

  # get 'user/show'
  # get 'user/edit'
end