require 'rubygems'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'
ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'crowdblog/rspec'
  require 'shoulda/matchers'
  require 'database_cleaner'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean

  RSpec.configure do |config|
    # ## Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr

    config.include FactoryGirl::Syntax::Methods

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = false

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"

    # RSpec infers what kind of spec are running
    config.infer_spec_type_from_file_location!
  end

end

#
# Reload Models - to avoid spork caching
#
Dir['app/models/**.rb'].each {|p| load "#{Rails.root}/#{p}"}
