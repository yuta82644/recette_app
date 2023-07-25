Rails.application.routes.draw do


  resources :recipes do
    collection do
      get :my_recipes
    end
  end
  devise_for :users

end
