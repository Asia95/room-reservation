Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #resources :rooms
  resources :reservations
  devise_for :users
  get 'users/reservations' => 'users#reservations', as: 'reservations_user'
  #get 'reservations/show' => 'reservations#show', as: 'show_reservation'
  #post 'reservations' => 'reservations#create', as: 'create_reservation'
  root 'reservations#index'
  post 'rooms/:id/reserve' => 'rooms#reserve', as: 'reserve_room'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
