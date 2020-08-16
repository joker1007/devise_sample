Rails.application.routes.draw do
  devise_for :user, skip: :all
  devise_for :database_authentications, class_name: "User::DatabaseAuthentication", controllers: {
    sessions: 'user/database_authentication/sessions'
  }
  devise_for :registrations, class_name: "User::Registration", controllers: {
    confirmations: 'user/registration/confirmations'
  }
  devise_scope :registration do
    post "/registrations", to: "user/registration/confirmations#finish",  as: "finish_user_registration"
  end
  devise_for :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
