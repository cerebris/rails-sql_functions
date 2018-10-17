require "test_helper"

module RailsSqlFunctions
  class LoadTest < Minitest::Test
    def test_it_loads_functions
      Rake::Task.define_task :environment

      init_dump_structure_after_load = RailsSqlFunctions.configuration.dump_structure_after_load
      RailsSqlFunctions.configuration.dump_structure_after_load = false
      assert_query_count(4) do
        Rake::Task['db:sql_functions:load'].execute
      end

    ensure
      RailsSqlFunctions.configuration.dump_structure_after_load = init_dump_structure_after_load
    end

    def test_it_loads_functions_from_a_changed_directory
      Rake::Task.define_task :environment

      init_load_path = RailsSqlFunctions.configuration.load_path
      init_dump_structure_after_load = RailsSqlFunctions.configuration.dump_structure_after_load
      RailsSqlFunctions.configuration.load_path = "db/load_functions"
      RailsSqlFunctions.configuration.dump_structure_after_load = false
      assert_query_count(2) do
        Rake::Task['db:sql_functions:load'].execute
      end

    ensure
      RailsSqlFunctions.configuration.load_path = init_load_path
      RailsSqlFunctions.configuration.dump_structure_after_load = init_dump_structure_after_load
    end
  end
end