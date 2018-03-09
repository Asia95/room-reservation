Rails.application.routes.draw do

  resources :rooms
  devise_for :users
  get 'welcome/index'
  get 'welcome/show'
  get 'reservation/show'
  post 'reservation' => 'reservation#create', as: 'create_reservation'
  root 'welcome#index'
  post 'rooms/:id/reserve' => 'rooms#reserve', as: 'reserve_room'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
