Mantragram::Application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations}
  resources  :users
  resources  :mantras
  resources  :styles, only: [:edit, :update]

  root 'static_pages#home'

  match '/remove_image/:id', to: 'mantras#remove_image', via: 'post', as: 'remove_image'
  match '/send_now/:id',     to: 'mantras#send_now',     via: 'post', as: 'send_now'
  match '/reset_style',      to: 'users#reset_style',    via: 'post', as: 'reset_style'

  match '/queue' => DelayedJobWeb, anchor: false, via: [:get, :post]

end
