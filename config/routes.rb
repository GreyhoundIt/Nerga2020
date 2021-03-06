Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/show'
  end
  namespace :admin do

    resources :fixtures do
      collection { post :import }
      member do
        post :upload_skeleton_start_sheet
        post :upload_start_sheet
        post :upload_team_overall
        post :upload_person_overall
      end
      get '/get_fixture_teamsheet', to: 'fixtures#get_fixture_teamsheet'
    end

    resources :zones do
      collection { post :import }
      member do
        post :upload_team_overall
        post :upload_person_overall
      end
    end

    resources :clubs do
      collection { post :import }
    end

    resources :players do
      collection do
        post :import
        get :remove_orphaned_players
      end
    end
  end

  namespace :user do
    resources :team_sheets
    post '/player/add' => 'players#add'
  end

  resources :zones

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'links' => 'static_pages#links'
  get 'honours' => 'static_pages#honours'
  get 'rules' => 'static_pages#rules'
  get 'finals' => 'static_pages#finals'
  get 'guidance' => 'static_pages#guidance'
  root to: 'static_pages#home'
end
