Rails.application.routes.draw do
  root "animals#index"

  resources :regions
  resources :animals do
    resources :sightings
  end
end
