$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ruby_sorts'

# get support files
Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f }
