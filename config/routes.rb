Rails.application.routes.draw do
  get 'unban_user/:id' => 'users#unban'
  get 'ban_user/:id' => 'users#ban'
  get 'remove_schedule' => 'schedules#remove_schedule'
  get 'remove_med' => 'prescriptions#remove_med'
  get 'pres_done' => 'prescriptions#pres_done'
  get '/doc_names', to: 'users#autoname'
  get '/pat_names', to: 'users#autopat'
  get '/pro_names', to: 'users#autopro'
  get '/get_avail', to: 'appointments#get_avail'
  devise_for :models


  get 'destroy_appt/:id' => 'appointments#destroy'
  get 'patient/list' => 'users#patient_list'
  get 'patient/search' => 'users#patient_search'
  get '/confirm_appointment' => 'appointments#confirm_appointment'
  resources :schedules
  resources :appointments
  resources :physical_records
  resources :diagnosis_records
  resources :prescriptions
  scope "/admin" do
    resources :users
  end
  devise_for :users, controllers: { registrations: "registrations" ,:sessions => "sessions" }
  resources :users, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#index'




end
