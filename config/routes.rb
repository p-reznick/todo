Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "todos#index"
  resources :todos
  patch '/todos/:id/complete', to: 'todos#complete', as: 'complete_todo'

  resources :users, only: [:show, :create, :edit, :update] do
    resources :categories, only: [:new, :create, :show]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/register', to: "users#new"
end
