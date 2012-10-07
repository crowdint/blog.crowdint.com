source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'crowdblog', '~> 0.1.0'
gem 'crowdint_auth', '~> 0.0.3'
gem 'fog'
gem 'newrelic_rpm'
gem 'quiet_assets'
gem 'unicorn'
gem 'vestal_versions', git: 'https://github.com/jodosha/vestal_versions.git'
gem 'yui-compressor'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'less-rails-bootstrap', '~> 2.1.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'autotest-rails'
  gem 'capybara-webkit'
  gem 'cucumber', '1.1.4'
  gem 'cucumber-ajaxer'
  gem 'cucumber-debug'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'heroku'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'spork'
  gem 'sqlite3'
  gem 'taps'
end

group :production do
  gem 'pg'
  gem 'therubyracer'
end
