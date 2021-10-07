Rails.application.routes.draw do
  root to: 'application#applet'
  get 'cookbook', to: 'cookbook#applet'

  namespace :cookbook do
    resources :recipes do
      resources :ingredients do
        namespace :inventory do
          resources :items, only: [] do
            collection do
              get :search
            end
          end
        end
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
