Rails.application.routes.draw do
  resources :user_daily_questionnaires
  resources :activities
  resources :user_data
  devise_for :users
  get 'home/about'
  root 'home#index'
  get '/daily_recommendations' => 'user_daily_questionnaires#daily_recommendations'
  get '/user_data' => 'user_data#show'
  get '/my_daily_questionnaire' => 'user_daily_questionnaires#index'
  get '/new_daily_questionnaire' => 'user_daily_questionnaires#new'
  get '/create_initial_UDQ' => 'user_daily_questionnaires#createInitialUDQ', as: :createInitialUDQ
  
end
