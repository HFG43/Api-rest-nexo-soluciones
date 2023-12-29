Rails.application.routes.draw do
  root to: "pages#index"

  resources :people, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :addresses, only: [:new, :create, :index, :show]
  end 

end
