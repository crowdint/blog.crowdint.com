worker_processes 2 # amount of unicorn workers to spin up
timeout 30         # restarts workers that hang for 30 seconds
preload_app true

before_fork do |server, worker|
  # Replace with MongoDB or whatever
  if defined? ActiveRecord::Base
    ActiveRecord::Base.connection.disconnect!
    Rails.logger.info('Disconnected from ActiveRecord')
  end

  # If you are using Redis but not Resque, change this
  if defined? Resque
    Resque.redis.quit
    Rails.logger.info('Disconnected from Redis')
  end

  sleep 1
end

after_fork do |server, worker|
  # Replace with MongoDB or whatever
  if defined? ActiveRecord::Base
    ActiveRecord::Base.establish_connection
    Rails.logger.info('Connected to ActiveRecord')
  end

  # If you are using Redis but not Resque, change this
  if defined? Resque
    Resque.redis = Rails.env.production? ?
      ENV['REDISTOGO_URL'] : 'http://localhost:6379'
    Rails.logger.info('Connected to Redis')
  end
end
