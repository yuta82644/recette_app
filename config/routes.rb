Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to:'recipes#index'

  resources :recipes do
    collection do
      get :my_recipes
    end
    resources :comments
  end

  resources :rooms do
     resources :room_comment
  end

  devise_for :users
  resources :categories, only: [:new, :create]

  resources :favorites
end
