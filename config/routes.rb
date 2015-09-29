Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
    devise_for :users, skip: :omniauth_callbacks, path_names: {
      sign_in: 'login',
      sign_out: 'logout',
    }
    match "/users/auth/:provider",
      constraints: { provider: /google|facebook/ },
      to: "devise/omniauth_callbacks#passthru",
      as: :omniauth_authorize,
      via: [:get, :post]
    match "/users/auth/:action/callback",
      constraints: { action: /google|facebook/ },
      to: "devise/omniauth_callbacks#:action",
      as: :omniauth_callback,
      via: [:get, :post]
    devise_scope :user do
      get 'users/logout' => 'devise/sessions#destroy'
      get 'logout' => 'devise/sessions#destroy'
    end

    if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: '/letter_opener'
    end

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
end
