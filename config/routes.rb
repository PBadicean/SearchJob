Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  namespace :candidate do
    root 'dashboard#show', as: :root
    resources :resumes
    resources :responses do
      resources :messages, module: 'responses'
    end
  end

  namespace :employer do
    root 'dashboard#show', as: :root
    resources :vacancies
    resources :responses do
      resources :messages, module: 'responses'
    end
  end

  namespace :admin do
    root 'dashboard#show', as: :root
    resources :categories
    resources :resumes

    namespace :users do
      resources :employers
      resources :candidates
      resources :admins
    end
  end

  namespace :registrations do
    resources :candidates
    resources :employers
  end

  resources :vacancies do
    resources :responses
  end

  resources :resumes
  resources :search

  get 'profile', action: :edit, controller: 'profiles'
  patch 'profile', action: :update, controller: 'profiles'
  put 'profile', action: :update, controller: 'profiles'

  get 'welcome/index'
  root 'resumes#index'
end
