Rails.application.routes.draw do

  devise_for :users

  namespace :candidate do
    root 'dashboard#show', as: :root
    namespace :users do
      get :registrations, to: 'registrations#index'
      post :registrations, to: 'registrations#create'
    end
  end

  namespace :employer do
    root 'dashboard#show', as: :root
    namespace :users do
      get :registrations, to: 'registrations#index'
      post :registrations, to: 'registrations#create'
    end
  end

  namespace :admin do
    root 'dashboard#show', as: :root
  end

  resources :categories do
  end

  get 'welcome/index'
  root 'welcome#index'
end
