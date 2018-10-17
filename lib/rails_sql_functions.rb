require "rails_sql_functions/version"
require "rails"

module RailsSqlFunctions
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load File.expand_path("../rails_sql_functions/load.rake", __FILE__)
      load File.expand_path("../rails_sql_functions/run.rake", __FILE__)
    end
  end
end
