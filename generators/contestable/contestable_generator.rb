class ContestableGenerator < Rails::Generator::Base
  def manifest
    record do |m|      
      m.migration_template "migrate/create_contests.rb", "db/migrate", :migration_file_name => "create_contests"
      m.migration_template "migrate/create_votes.rb", "db/migrate", :migration_file_name => "create_votes"
      m.migration_template "migrate/create_nominations.rb", "db/migrate", :migration_file_name => "create_nominations"
    end
  end
end
