ENV["SINATRA_ENV"] = "test"

require_relative '../config/environment'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate SINATRA_ENV=test` to resolve the issue.'
end

ActiveRecord::Base.logger = nil

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Rack::Test::Methods
  config.include Capybara::DSL
  DatabaseCleaner.strategy = :truncation

  config.before do
    DatabaseCleaner.clean
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.order = 'default'
<<<<<<< HEAD
    
=======
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
end

def app
  Rack::Builder.parse_file('config.ru').first
end

<<<<<<< HEAD
Capybara.app = app


=======
Capybara.app = app
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
