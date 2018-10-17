require "rails_sql_functions/execute_sql"
require "rails_sql_functions/configuration"

namespace :db do
  namespace :sql_functions do
    task :load => :environment do
      include RailsSqlFunctions::ExecuteSql

      run_in_dir(RailsSqlFunctions.configuration.load_path)
      Rake::Task['db:structure:dump'].invoke if RailsSqlFunctions.configuration.dump_structure_after_load
    end
  end
end