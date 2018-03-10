Rails.application.routes.draw do

  resources :rooms
  resources :reservations
  devise_for :users
  get 'reservations/show' => 'reservation#show', as: 'show_reservation'
  post 'reservations' => 'reservation#create', as: 'create_reservation'
  root 'reservations#index'
  post 'rooms/:id/reserve' => 'rooms#reserve', as: 'reserve_room'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
