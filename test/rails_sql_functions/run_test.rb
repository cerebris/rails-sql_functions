require "test_helper"

module RailsSqlFunctions
  class RunTest < Minitest::Test
    def test_it_runs_functions
      Rake::Task.define_task :environment

      assert_query_count(4) do
        Rake::Task['db:sql_functions:run'].execute
      end
    end

    def test_it_runs_functions_from_a_changed_directory
      Rake::Task.define_task :environment

      init_run_path = RailsSqlFunctions.configuration.run_path
      RailsSqlFunctions.configuration.run_path = "db/run_functions"
      assert_query_count(3) do
        Rake::Task['db:sql_functions:run'].execute
      end

    ensure
      RailsSqlFunctions.configuration.run_path = init_run_path
    end
  end
end