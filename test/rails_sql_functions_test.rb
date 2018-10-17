require "test_helper"

class RailsSqlFunctionsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Rails::SqlFunctions::VERSION
  end
end
