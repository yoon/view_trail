# Sets up the Rails environment for Cucumber
ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/../../../../..'
require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb'))
require 'cucumber/rails/world'

# Sets up webrat
require 'webrat'

Webrat.configure do |config|
  config.mode = :rails
end

require 'cucumber/rails/rspec'
require 'webrat/core/matchers'

# Sets up controllers
require 'application_controller'
require 'view_trail'

class ApplicationController
  def rescue_action(e)
    raise e
  end
  cattr_accessor :cu
  # Returns id of hypothetical current user
  def current_user
    self.cu
  end
end

class FooController < ApplicationController
  has_view_trail :except => :bar
  def foo
    head :ok
  end
  def bar
    head :ok
  end
end

# Sets up routes
ActionController::Routing::Routes.draw do |map|
  map.foo "/foo", :controller => "foo", :action => "foo"
end
