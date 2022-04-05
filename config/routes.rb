Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "animals#index"
  resources :animals do
    resources :sightings do
      get 'report', on: :member
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
