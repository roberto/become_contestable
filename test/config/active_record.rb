#
# test helper for ActiveRecord related tests
#

require "active_record"
require "active_record/fixtures"
require "active_record/test_case"

class ActiveRecord::TestCase #:nodoc:
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
end

#
# load database config and initialize test logger

config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/../log/test.log")

db_config = if db = ENV['DB']
  config[db] or raise("Invalid DB setting #{db.inspect}")
else
  config['sqlite3'] or raise("Invalid DB setting for 'sqlite3' adapter")
end

ActiveRecord::Base.establish_connection(db_config)

ActiveRecord::Migration.verbose = false
