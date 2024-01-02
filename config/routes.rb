Rails.application.routes.draw do
  root to: "people#index"

  namespace :api do
    namespace :v1 do
      resources :people, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
        resources :addresses, only: [:new, :create]
      end
    end    
  end 

end
