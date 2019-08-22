Rails.application.routes.draw do
  
  
  resources :charges
  devise_for :users

 resources :events do resources :attendances 
 post '/subscribe', to: 'events#subscribe'
    post '/unsubscribe', to: 'events#unsubscribe'
    get '/invite', to: 'events#invite' 
    post '/invite', to: 'events#invite'     
    post '/invite/:id', to: 'events#subscribe_friends', as: 'user_invited'
  
 end
root 'events#index'

 
  get 'static_pages/secret'
 
  get 'users/:id' => 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
