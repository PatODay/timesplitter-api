# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks, except: %i[new edit]
  # RESTful routes
  resources :examples, except: %i[new edit]
  resources :users, only: %i[index show update]

  get '/tasks' => 'tasks#index'
  get '/tasks/:id' => 'tasks#show'
  delete '/tasks/:id' => 'tasks#destroy'
  post '/tasks' => 'tasks#create'
  patch '/tasks/:id' => 'tasks#update'

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
end
