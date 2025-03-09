Rails.application.routes.draw do
  get "photos/index"
  resources :photos, only: [:index]
  root 'photos#index' 
end
