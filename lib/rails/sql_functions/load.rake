require "rails/sql_functions/execute_sql"
require "rails/sql_functions/configuration"

namespace :db do
  namespace :sql_functions do
    task :load => :environment do
      include Rails::SqlFunctions::ExecuteSql

      run_in_dir(Rails::SqlFunctions.configuration.load_path)
      Rake::Task['db:structure:dump'].invoke if Rails::SqlFunctions.configuration.dump_structure_after_load
    end
  end
end