Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/sandbox' => 'scenes#index'
  # resources :scripts do

  resources :stories, only: [:new, :create, :show] do
    resources :scenes, only: [:show]
    # resources :pictures, only: [:create]
    # resources :generated_words, only: [:create]
  end

  root 'stories#new'
end
