Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resource :two_factor_auth, only: [:new, :create, :destroy] do
    member do
      post :codes
    end
  end

end
