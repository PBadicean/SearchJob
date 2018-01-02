Rails.application.routes.draw do

  devise_for :users

  namespace :candidate do
    namespace :users do
      get :registrations, to: 'registrations#index'
      post :registrations, to: 'registrations#create'
    end
  end

  get 'welcome/index'
  root 'welcome#index'
end
