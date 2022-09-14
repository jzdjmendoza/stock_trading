Rails.application.routes.draw do
  devise_for :users, controllers: {
    # sessions: 'users/sessions', 
    registrations: 'users/registrations'
  }

  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end

    authenticated do
      root 'devise/sessions#new', as: :authenticated_root
    end
  end
  
  # admin paths
  get '/admin/users' => 'admins/users#index'
  get '/admin/users/new' => 'admins/users#new'
  get '/admin/users/edit' => 'admins/users#edit'
  get '/admin/users/:id' => 'admins/users#show', as: 'view_user'
  put '/admin/users' => 'admins/users#update', as: 'update_user'
  post '/admin/users' => 'admins/users#create', as: 'create_user'


  # trader paths
  get '/dashboard' => 'traders/dashboard#index', as: 'dashboard'
  get '/dashboard/transactions' => 'traders/transaction#index', as: 'transaction'
  get '/dashboard/transactions/new' => 'traders/transaction#new', as: 'new_transaction'
  post '/dashboard/transactions' => 'traders/transaction#create', as: 'create_transaction'
  get '/dashboard/portfolio' => 'traders/portfolio#index', as: 'portfolio'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # # root "articles#index"
  # root to: "devise/sessions#new"
end
