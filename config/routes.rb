Rails.application.routes.draw do
  get 'diagnosis_record/index'

  get 'diagnosis_record/new'

  get 'diagnosis_record/edit'

  get 'diagnosis_record/show'

  get 'appointment/index'

  get 'appointment/edit'

  get 'appointment/new'

  get 'appointment/show'

  devise_for :users
  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

end
