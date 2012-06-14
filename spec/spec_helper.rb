require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'


Spork.prefork do
  require 'rubygems'
  ENV["RAILS_ENV"] ||= 'test'

  require 'rails/application'
  Spork.trap_method(Rails::Application, :reload_routes!)
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)

  require File.expand_path("../../config/environment", __FILE__)

  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rails'
  require 'capybara/poltergeist'
  require 'valid_attribute'
  require 'cancan/matchers'

  ## other requires to reduce (improve) test load-time
  # as test with script tooked from http://www.opinionatedprogrammer.com/2011/02/profiling-spork-for-faster-start-up-time/
  require 'rspec/core'
  require 'rspec/mocks'
  require 'rspec/expectations'
  require 'treetop/runtime'

  # ver http://blog.plataformatec.com.br/2011/12/three-tips-to-improve-the-performance-of-your-test-suite/
  Devise.stretches = 1
  Rails.logger.level = 4

  class ActiveRecord::Base
    mattr_accessor :shared_connection
    @@shared_connection = nil

    def self.connection
      @@shared_connection || retrieve_connection
    end
  end

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
    config.include Devise::TestHelpers, :type => :controller

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    config.before :each do
      Capybara.current_driver = :poltergeist if example.metadata[:javascript]
    end

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false
  end
end

Spork.each_run do
  # Forces all threads to share the same connection. This works on
  # Capybara because it starts the web server in a thread.
  ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

  FactoryGirl.reload
end
