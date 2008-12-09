#
# load rails in test mode
ENV['RAILS_ENV'] = 'test'
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/../../../../..'

FIXTURES_ROOT = File.join(File.dirname(__FILE__), "/../fixtures")
require 'test/unit'

require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb'))

# RAILS_DEFAULT_LOGGER = Logger.new(“#{RAILS_ROOT}/log/#{RAILS_ENV}.log”)

require "active_support"
require "active_support/test_case"


require File.dirname(__FILE__) + '/active_record.rb'
require File.dirname(__FILE__) + '/action_pack.rb'

require File.dirname(__FILE__) + '/models.rb'
require File.dirname(__FILE__) + '/controllers.rb'

require File.dirname(__FILE__) + '/mini_shoulda.rb'
