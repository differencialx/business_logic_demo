Rails.application.routes.draw do
  namespace :trailblazer_namespace do
    resources :characters, only: %i[create]
  end

  namespace :active_interaction_namespace do
    resources :characters, only: %i[create]
  end

  namespace :interactor_namespace do
    resources :characters, only: %i[create]
  end

  namespace :decouplio_namespace do
    resources :characters, only: %i[create]
  end

  namespace :service_namespace do
    resources :characters, only: %i[create]
  end
end
