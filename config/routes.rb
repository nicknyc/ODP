Rails.application.routes.draw do
  # get 'prescription/index'
  #
  # get 'prescription/show'
  #
  # get 'prescription/new'
  #
  # get 'prescription/edit'

  # get 'schedule/index'
  #
  # get 'schedule/new'
  #
  # get 'schedule/edit'
  #
  # get 'schedule/show'

  # get 'physical_record/index'
  #
  # get 'physical_record/new'
  #
  # get 'physical_record/edit'
  #
  # get 'physical_record/show'
  #
  # get 'diagnosis_record/index'
  #
  # get 'diagnosis_record/new'
  #
  # get 'diagnosis_record/edit'
  #
  # get 'diagnosis_record/show'

  # get 'appointment/index'
  #
  # get 'appointment/edit'
  #
  # get 'appointment/new'
  #
  # get 'appointment/show'

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
  scope "/admin" do
    resources :users
  end
  get 'destroy_appt/:id' => 'appointments#destroy'
  resources :schedules
  resources :appointments
  resources :physical_records
  resources :diagnosis_records
  resources :prescriptions

  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"



end
