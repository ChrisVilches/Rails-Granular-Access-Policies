Rails.application.routes.draw do

  devise_for :users

  # Para que se pueda usar tambien con GET y no solo DESTROY
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'home#index'

  resources :articles, :only => [:index, :show, :create, :update, :destroy] 

end
