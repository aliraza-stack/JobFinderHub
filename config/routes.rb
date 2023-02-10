Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :user,
             :path => '',
             :path_names => { :sign_in => "login",
                              :sign_out => "logout",
                              :sign_up => "register",
                              :edit => "edit/:name",
                              :password => "password",
                              :confirmation => "verification",
                              :unlock => "unlock" },
             controllers: {
               sessions: 'users/sessions',
               registration: 'users/registrations',
               passwords: 'users/passwords',
               confirmations: 'users/confirmations',
               unlocks: 'users/unlocks'
             }
  resources :jobs
  resources :issues
  root 'homepage#index'
  get 'about' => 'homepage#about'
  get 'contact' => 'contact_us#contact'
  post 'contact' => 'contact_us#contact'
  get '/profile/:id' => 'users#show', as: 'profile'
  get 'clients/dashboard' => 'clients#dashboard', as: 'client_dashboard'
  get 'map' => 'clients#map', as: 'client_map'
  get 'labors/dashboard' => 'labors#dashboard', as: 'labor_dashboard'
  get 'labors' => 'users#index', as: 'labors'


end
