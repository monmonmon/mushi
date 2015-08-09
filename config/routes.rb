Rails.application.routes.draw do
  devise_for :users, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
  }

  controller :welcome do
    get 'hoe'
    get 'about'
    get 'contact'
    get 'team'
  end

  resources :bugs

  resources :posts

  resources :comments

  root 'welcome#index'
end
