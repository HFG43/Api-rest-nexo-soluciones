Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  require 'csv'

  namespace :api do
    namespace :v1 do
      resources :people, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
        resources :addresses, only: [:new, :create]
        collection do
          get 'export_csv'       
        end  
      end
    end    
  end 

end
