require "rails/sql_functions/execute_sql"
require "rails/sql_functions/configuration"

namespace :db do
  namespace :sql_functions do
    task :run => :environment do
      include Rails::SqlFunctions::ExecuteSql

      run_in_dir(Rails::SqlFunctions.configuration.run_path)
    end
  end
end