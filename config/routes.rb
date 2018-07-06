Rails.application.routes.draw do
  root :to => 'videos#index'
  resources :videos


  #watch
  get '/watch/:id', to: 'videos#render_video'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
