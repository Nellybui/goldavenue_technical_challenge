Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :jewelers do
    resources :jewels
  end

  resources :material_types, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :stone_types, only: [:index, :new, :create, :edit, :update, :destroy]

  # Defines the root path route ("/")
  root "public#index"
end
