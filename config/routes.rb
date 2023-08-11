Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to:'top#index'

  resources :recipes do
    collection do
      get :my_recipes
    end
    resources :comments
  end

  resources :rooms do
    member do
      patch :remove_member
      post :invite_member
    end
     resources :room_comments
     resources :tasks
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
   post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
end
  resources :categories, only: [:new, :create]

  resources :favorites
end
