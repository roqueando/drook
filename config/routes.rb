Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # AUTH Requests
  get '/', to: 'auth#index'
  get '/register', to: 'auth#register'
  get '/user/profile/:id', to: 'auth#profile' 
  get '/logout', to: 'auth#destroy'

  post '/register', to: 'auth#store'
  post '/authenticate', to: 'auth#authenticate'

  put '/user/profile/:id', to: 'auth#update_profile'

  # Audio Requests
  get '/app', to: 'audios#index'
  get '/audio/stream/:id', to: 'audios#stream', as: :stream
  post '/favorite/add/:audio_id', to: 'audios#add_favorite'

  resource :audios
end
