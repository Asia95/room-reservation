Rails.application.routes.draw do

  resources :rooms
  devise_for :users
  get 'welcome/index'
  get 'welcome/show'
  root 'welcome#index'
  post 'rooms/:id/reserve' => 'rooms#reserve', as: 'reserve_room'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
