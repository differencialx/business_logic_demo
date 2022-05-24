Rails.application.routes.draw do
  namespace :trailblazer_namespace do
    resources :characters, only: %i[new create]
  end

  namespace :active_interaction_namespace do
    resources :characters, only: %i[new create]
  end

  namespace :mutations_namespace do
    resources :characters, only: %i[new create]
  end

  namespace :interactor_namespace do
    resources :characters, only: %i[new create]
  end

  namespace :decouplio_namespace do
    resources :characters, only: %i[new create]
  end
end
