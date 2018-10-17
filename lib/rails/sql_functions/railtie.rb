require 'rails/railtie'

module Rails
  module SqlFunctions
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load File.expand_path("../load.rake", __FILE__)
        load File.expand_path("../run.rake", __FILE__)
      end
    end
  end
end