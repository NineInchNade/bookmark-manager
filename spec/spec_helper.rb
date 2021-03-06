ENV["RACK_ENV"] = "test"

require './server'

require 'capybara/rspec'
require 'database_cleaner'

Capybara.app = Sinatra::Application.new

RSpec.configure do |config|

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = :random


  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end