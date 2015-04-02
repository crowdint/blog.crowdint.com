Rails.application.routes.draw do
  get '/sessions/destroy' => 'sessions#destroy', as: :destroy_user_session
  get 'auth/:provider/callback' => 'sessions#create', as: :log_in

  get 'search/(:q)', to: 'searches#index', as: 'search'
  get 'about', to: 'about#show'

  resources :categories, only: :show

  namespace :admin do
    resource :dropbox_authorization
    resource :dropbox_sync

    resources :authors, :only => :index
    resources :categories
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
    constraints: { state: /finished|reviewed/ },
    as: :admin_posts_by_state

  mount Crowdblog::Engine => '/'

  match '/404', to: 'errors#file_not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
