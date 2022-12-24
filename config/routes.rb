Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about' =>'homes#about'

  resources:books, only:[:index,:show,:create,:edit,:update,:destroy]
  #get'books/:id/edit'=>'books#edit', as:'edit_book'
  #patch 'books/:id' => 'books#update', as:'update_book'
  #delete'books/:id'=>'books#destroy', as:'destroy_book'

  resources:users, only:[:index,:show,:edit,:update,]
  #get 'users/:id/edit'=>'users#edit', as:'edit_user'
  #patch 'users/:id'=>'users#update', as:'update_user'


 #resources:post_images, only:[:new,:index,:show,:create]
 #post_imagesはコントローラーはないので
 #resourcesはpatchもgetもdeleteも全て網羅しているので設定しなくて良い。

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'

  # get 'user/show'
  # get 'user/edit'
end