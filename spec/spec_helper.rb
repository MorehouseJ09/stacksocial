"
  Initialize and set up application testing etc
  Create basic twitter omniauth middleware hash
  Running database_cleaner with :truncation for mongoid

"
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  # config.infer_base_class_for_anonymous_controllers = false

  OmniAuth.config.test_mode = true

  # generate a valid twitter authentication using my application.yml configuration etc
  OmniAuth.config.mock_auth[:twitter] = {

    :provider => "twitter",
    :uid => ENV['TWITTER_UID'],
    :credentials => {
      :token => ENV['TWITTER_ACCESS_TOKEN'], 
      :secret => ENV['TWITTER_ACCESS_TOKEN_SECRET']
    }
  }

  config.order = "random"

  cleaner = true 

  # initialize our databasecleaner strategy
  DatabaseCleaner.strategy = :truncation

  # set whether or not we should use the databasecleaner during production
  # cleaner = true
  # global before all hook
  config.before(:all) do

    DatabaseCleaner.start if cleaner

  end

  # global after all hook
  config.after(:all) do

    DatabaseCleaner.clean if cleaner

  end
end

