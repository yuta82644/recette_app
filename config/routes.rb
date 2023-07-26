Rails.application.routes.draw do
  root to:'recipes#index'

  resources :recipes do
    collection do
      get :my_recipes
    end
  end

  resources :rooms
  devise_for :users
  resources :categories, only: [:new, :create]

end
