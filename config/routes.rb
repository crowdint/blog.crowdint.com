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
    constraints: { :state => /(finished)/ },
    as: :admin_finished_posts

  mount Crowdblog::Engine => '/'

end
