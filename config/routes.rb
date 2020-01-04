Rails.application.routes.draw do

  get "/" => "books#index_read"

 # devise_for :users, only: [:show]

 # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }


  get 'users/:id' => "users#show",as: "users_show"

  get 'books/new'

  get 'books/index_unread'

  get 'books/index_read'

  post "books" => "books#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
