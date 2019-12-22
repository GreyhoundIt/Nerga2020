Rails.application.routes.draw do
  namespace :admin do
    resources :fixtures do
      collection { post :import }
    end
  end
  namespace :admin do
    resources :zones do
      collection { post :import }
    end
  end
  namespace :admin do
    resources :clubs do
      collection { post :import }
    end
  end

  resources :players do
    collection { post :import }
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'links' => 'static_pages#links'
  get 'honours' => 'static_pages#honours'
  get 'rules' => 'static_pages#rules'
  get 'sponsors' => 'static_pages#sponsors'
  root to: 'static_pages#home'
end
