Rails.application.routes.draw do
  get 'search/(:q)', to: 'searches#index', as: 'search'
  get 'about', to: 'about#show'

  devise_for :users, controllers: { omniauth_callbacks: 'crowdint_auth/omniauth_callbacks' }

  devise_scope :user do
    get 'google_apps_sign_in', to: 'crowdint_auth/omniauth_callbacks#google_apps_sign_in'
  end

  namespace :admin do
    resource :dropbox_authorization
    resource :dropbox_sync

    resources :authors, :only => :index
  end

  get '/:year/:month/:day/:id(.:format)', to: 'crowdblog/posts#show', as: 'post',
    constraints: { year: /\d+/ }

  get '/preview/:id', to: 'previews#show', constraints: { id: /\d+/ }, as: 'preview'

  get '/archive', to: 'archive#show', as: 'archive'

  get '/atom.(:format)', to: 'feeds/atom_feeds#show', as: 'atom_feed'

  get 'sitemap.(:format)', to: 'sitemap#show'
  get '/author/:id', to: 'posts_by_author#index', as: 'posts_by_author'

  root to: "crowdblog/posts#index"

  get 'admin/posts/:state',
    to: 'crowdblog/admin/posts#index',
    constraints: { :state => /(finished)/ },
    as: :admin_finished_posts

  mount Crowdblog::Engine => '/'

end
