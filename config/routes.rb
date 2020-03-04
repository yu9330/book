Rails.application.routes.draw do

  get 'favorites/create'

  get 'favorites/destroy'

  # get 'faborites/create'

  # get 'faborites/destroy'

  post '/rate' => 'rater#create', :as => 'rate'
  get "/" => "books#index_read"

 # devise_for :users, only: [:show]

 # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :books do
    resources :favorites,only: [:create,:destroy]
  end


  get 'users/:id' => "users#show",as: "users_show"

  resources :books, except: [:index,:show] do collection do
    get "index_unread"
    get "index_read"
      end
    end

  resources :users

 # get 'books/new'
 # post "books" => "books#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
