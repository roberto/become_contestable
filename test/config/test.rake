desc 'Default: run tests for plugin.'
task :default => :test

desc "Test the plugin."
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = File.dirname(__FILE__) + '/../tests/**/*_test.rb'
  t.verbose = true
end
