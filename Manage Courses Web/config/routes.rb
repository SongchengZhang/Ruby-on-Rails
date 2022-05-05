Rails.application.routes.draw do
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :courses
  resources :recommendations
  resources :evaluations
  resources :application_forms
  

  root "application#index"
  
  get "application/index"
  get 'students/index', action: :index, controller: 'students'
  get 'admin/index', action: :index, controller: 'admin'
  get 'admin/error', action: :error, controller: 'admin'
  get '/home', to: "home#index"
  post '/home', to: "home#index"
  get '/:controller/:action', to: 'application'
  get '/site/index', action: :index, controller: 'courses'
  post 'admin/approve_instructor'
  post 'students/approve_pending'
  post 'admin/load', action: :load, controller: 'admin'
  post 'admin/setLink', action: :setLink, controller: 'admin'
  post 'admin/approve_admin'
  post 'admin/approve_course'
  post 'admin/refuse_admin'
  post 'admin/approve_grader'
  post 'admin/disapprove_course'
  post 'admin/disapprove_grader'
  post 'admin/increaseMax'
  post 'admin/decreaseMax'
  post 'instructor/apply_course'
  post 'student/apply_grader'
  post 'students/approve_pending_ins'
  post 'students/approve_pending_admin'
  post 'instructor/approve_pending_admin'
  get '/search', to: 'search#search'
  post 'recommendations/apply', action: 'apply', controller: 'recommendations'
  post 'recommendations/delete', action: 'delete', controller: 'recommendations'
end
