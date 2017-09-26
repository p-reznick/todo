Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "todos#index"
  resources :todos
  patch '/todos/:id/complete', to: 'todos#complete', as: 'complete_todo'
end
