Mantragram::Application.routes.draw do
  devise_for :users
  resources :users
  resources :mantras

  root 'static_pages#home'

  match '/remove_image/:id', to: 'mantras#remove_image', via: 'post', as: 'remove_image'
  match '/send_now/:id',     to: 'mantras#send_now',     via: 'post', as: 'send_now'

  match '/queue' => DelayedJobWeb, anchor: false, via: [:get, :post]

end
