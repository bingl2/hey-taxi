Rails.application.routes.draw do
  mount GrapeSwaggerRails::Engine => '/swagger'


  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
