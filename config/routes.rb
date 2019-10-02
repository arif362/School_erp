Rails.application.routes.draw do



  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
                                    registrations: 'users/registrations',
                                    confirmations: 'users/confirmations',
                                    sessions: 'users/sessions'
                                  }


  root to: 'home_page#index'



  get '/dashboard_home', to: 'dashboards#home'
  # get '/new_student/:dept', to: 'students#new', as: 'student_new'

  resources :schools do
  end

  resources :departments do
    member do
      get :switch
    end
  end

  resources :users do
    collection do
      post :add
    end
    member do
      get :invite
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
