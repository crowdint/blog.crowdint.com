Crowdblog::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'crowdint_auth/omniauth_callbacks' }

  devise_scope :user do
    match 'google_apps_sign_in', to: 'crowdint_auth/omniauth_callbacks#google_apps_sign_in'
  end

  namespace :admin do
    resource :dropbox_authorization
    resource :dropbox_sync

    resources :authors, :only => :index
  end

  match '/:year/:month/:day/:id(.:format)', to: 'crowdblog/posts#show', as: 'post',
      constraints: { year: /\d+/ }

  match '/preview/:id', to: 'previews#show', constraints: { id: /\d+/ }, as: 'preview'

  match '/archive', to: 'archive#show', as: 'archive'

  match '/atom.(:format)', to: 'feeds/atom_feeds#show', as: 'atom_feed'

  mount Crowdblog::Engine => '/'


  match 'sitemap.(:format)', to: 'sitemap#show'
  match '/author/:id', to: 'posts_by_author#index', as: 'posts_by_author'

  root to: "posts#index"

end
