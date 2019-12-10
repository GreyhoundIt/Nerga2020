Rails.application.routes.draw do
  resources :players do
    collection {post :import}
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'links' => 'welcome#links'
  get 'honours' => 'welcome#honours'
  get 'rules' => 'welcome#rules'
  get 'sponsors' => 'welcome#sponsors'
  root to: 'welcome#home'
end
