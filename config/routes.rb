Rails.application.routes.draw do
  root to: 'to_dos#index'
  resources :to_dos

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :to_dos
    end
  end
end
