Rails.application.routes.draw do
  namespace :cookbook do
    get '/', to: 'applet#cookbook'

    resources :recipes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end