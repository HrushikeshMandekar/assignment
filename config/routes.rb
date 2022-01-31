Rails.application.routes.draw do
  root 'pages#home'
  resources :courses, only: [:index, :new, :create]
  resources :tutors, only: [:index, :new, :create]
end
