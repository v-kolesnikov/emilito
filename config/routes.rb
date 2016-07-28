Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v3 do
      resources :workspaces do
        resources :tickets
        resources :users
      end
    end
  end

end
