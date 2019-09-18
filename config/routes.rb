Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, as: nil, defaults: { format: 'json' } do
    namespace :v1, as: nil do
      post 'registrations',  to: 'users/registrations#create', as: 'registrations'
      post 'api_login',  to: 'users/sessions#login', as: 'api_login'
      delete 'logout',  to: 'users/sessions#logout', as: 'api_logout'
      get 'confirmations/:token', to: 'users/confirmations#show', as: 'api_confirmations'
      post 'password_resets', to: 'password_resets#create', as: 'api_password_resets'
      get 'password_resets/:token/edit', to: 'password_resets#edit', as: 'api_edit_password_resets'
      put 'password_resets/:token', to: 'password_resets#update', as: 'api_update_password_resets'
      resources :verification_codes, :only => [:create]
      put 'verification_codes/:id' => 'verification_codes#verify', as: 'verify'
      get 'twilio_callback' => 'verification_codes#callback'
      resources :users, :only => [:update, :show] do
          collection do
            get :confirmation_mail
          end
      end
      # resources :countries, :only => [:index]
      # resources :occupations, :only => [:index]
      # resources :banks, :only => [:index, :show]
      # resources :beneficiaries, :only => [:create, :update, :index, :show]
      # get 'branches/index_by_bank/:bank_id' => 'branches#index_by_bank', as: 'index_by_bank'
      # get 'beneficiaries/index_by_user' => 'beneficiaries#index_by_user', as: 'index_by_user'
      # get 'beneficiaries/filtered_index_by_user' => 'beneficiaries#filtered_index_by_user', as: 'filtered_index_by_user'
      # get 'beneficiaries/filtered_index_by_bank' => 'beneficiaries#filtered_index_by_bank', as: 'filtered_index_by_bank'
      # get 'beneficiaries/filtered_index_by_mobile' => 'beneficiaries#filtered_index_by_mobile', as: 'filtered_index_by_mobile'
      # resources :transactions, :only => [:create, :index, :show]
    end
  end    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
