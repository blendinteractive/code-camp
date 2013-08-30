Codecamp::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root :to => 'high_voltage/pages#show', :id => 'home'

  #Speakers
  get '/speakers', to: 'speakers#index'
  #get '/speakers/:id', to: 'speakers#show', as: 'speaker'

  #Sessions
  get '/sessions', to: 'sessions#index'
  get '/sessions/:id', to: 'sessions#show', as: 'session'


  get 'browser' => 'browser#index'


end
