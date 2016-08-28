Rails.application.routes.draw do
  use_doorkeeper

  root 'rails/welcome#index'

  namespace :api do
    namespace :v3 do
      resources :workspaces do
        resources :tickets, except: [:new, :edit]
        resources :users
      end
    end
  end

  scope module: :web do
    get  '/sign_in',  to: 'sessions#new'
    post '/sign_in',  to: 'sessions#create'
    post '/sign_out', to: 'sessions#destroy'

    scope module: :accounts do
      get '/dashboard', to: 'dashboard#show'
    end
  end

  get '404', to: 'api/errors#not_found'
  get '406', to: 'api/errors#not_acceptable'
  get '500', to: 'api/errors#internal_server_error'
end
