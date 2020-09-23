Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'auth#index'
  get '/register', to: 'auth#register'
  post '/register', to: 'auth#store'
  post '/authenticate', to: 'auth#authenticate'

  get '/app', to: 'audios#index'
  get '/audio/stream/:id', to: 'audios#stream', as: :stream
  get '/user/profile/:id', to: 'auth#profile' 
  put '/user/profile/:id', to: 'auth#update_profile'
  resource :audios
end
