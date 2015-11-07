ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

module Testable
  def content_of_length_101
    "123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 !"
  end
end

class ActiveSupport::TestCase
  fixtures :all
  include Testable
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Testable
end
