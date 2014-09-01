# http://ctshryock.com/posts/2012/07/12/running-rails-with-puma-on-heroku.html

workers Integer(ENV['PUMA_WORKERS'] || 3)
threads Integer(ENV['MIN_THREADS']  || 0), Integer(ENV['MAX_THREADS'] || 16)

preload_app!

environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
