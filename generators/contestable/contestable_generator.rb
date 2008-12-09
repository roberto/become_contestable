class ContestableGenerator < Rails::Generator::Base
  def manifest
    record do |m|      
      m.migration_template "migration.rb", "db/migrate", :migration_file_name => "become_contestable_migration"
    end
  end
end
