# http://ctshryock.com/posts/2012/07/12/running-rails-with-puma-on-heroku.html

environment ENV['RACK_ENV']
threads 0,5

workers 3
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
