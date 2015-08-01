Rails.application.routes.draw do
  devise_for :users

  controller :welcome do
    get 'hoe'
    get 'about'
    get 'contact'
    get 'team'
  end

  root 'welcome#index'
end
