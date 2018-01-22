Rails.application.routes.draw do

  devise_for :users

  namespace :candidate do
    root 'dashboard#show', as: :root
    resources :resumes
  end

  namespace :employer do
    root 'dashboard#show', as: :root
  end

  namespace :admin do
    root 'dashboard#show', as: :root
    resources :categories

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


  resources :resumes do
  end

  get 'welcome/index'
  root 'welcome#index'
end
