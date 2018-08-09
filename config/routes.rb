Rails.application.routes.draw do
  root :to => 'videos#index'
  resources :videos


  #watch
  get '/watch/:id', to: 'videos#render_video'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/search/:name', to: 'videos#search_video', as: 'search'
  get '/suggestions/:name', to: 'videos#suggestions', as: 'suggestions'
  get '/auto_suggestions/:keyword', to: 'keyword#auto_suggestions', as: 'auto_suggestion'
  get '/admin/set_video_tags/:id', to: 'admin#set_video_tags', as: 'set_video_tags'
end
