Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount ActionCable.server => '/cable'
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', controllers: {
    registrations:  'overrides/registrations',
  }
  scope path: '/api/v1' do
    resources :posts
    resources :initial_state
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
