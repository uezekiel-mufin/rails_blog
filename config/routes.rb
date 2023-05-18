Rails.application.routes.draw do
  # devise_for :users, views: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users do
    resources :posts do
      resources :comments
      resources :likes, only: %i[create destroy]
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[index show] do
        resources :posts, only: %i[index] do
          resources :comments, only: %i[index create]
        end
      end
    end
  end

end