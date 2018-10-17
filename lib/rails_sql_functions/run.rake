require "rails_sql_functions/execute_sql"
require "rails_sql_functions/configuration"

namespace :db do
  namespace :sql_functions do
    task :run => :environment do
      include RailsSqlFunctions::ExecuteSql

      run_in_dir(RailsSqlFunctions.configuration.run_path)
    end
  end
end