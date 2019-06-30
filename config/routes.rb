Rails.application.routes.draw do
  mount GrapeSwaggerRails::Engine => '/swagger'


  namespace :api do
    namespace :v1 do
      resources :users
      post 'users/login' => 'users#login'

      resources :transports
      resources :passengers
      resources :drivers

    end
  end
end
