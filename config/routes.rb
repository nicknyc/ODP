Rails.application.routes.draw do
  get 'presciption/index'

  get 'presciption/show'

  get 'presciption/new'

  get 'presciption/edit'

  # get 'schedule/index'
  #
  # get 'schedule/new'
  #
  # get 'schedule/edit'
  #
  # get 'schedule/show'

  get 'medicine/index'

  get 'medicine/show'

  get 'medicine/edit'

  get 'medicine/new'

  get 'physical_record/index'

  get 'physical_record/new'

  get 'physical_record/edit'

  get 'physical_record/show'

  get 'diagnosis_record/index'

  get 'diagnosis_record/new'

  get 'diagnosis_record/edit'

  get 'diagnosis_record/show'

  get 'appointment/index'

  get 'appointment/edit'

  get 'appointment/new'

  get 'appointment/show'

  get 'unban_user/:id' => 'users#unban'
  get 'ban_user/:id' => 'users#ban'
  get 'remove_schedule' => 'schedules#remove_schedule'
  get '/doc_names', to: 'users#autoname'

  devise_for :models
  scope "/admin" do
    resources :users
  end
  resources :schedules

  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"



end
