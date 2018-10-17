module RailsSqlFunctions
  class Configuration
    attr_reader :load_path,
                :run_path,
                :dump_structure_after_load

    def initialize
      self.load_path = Rails.root.join("db", "functions")
      self.run_path = Rails.root.join("db", "functions")
      self.dump_structure_after_load = true
    end

    def load_path=(load_path)
      if load_path.is_a?(Pathname)
        @load_path = load_path
      else
        @load_path = Rails.root.join(load_path)
      end
    end

    def run_path=(run_path)
      if run_path.is_a?(Pathname)
        @run_path = run_path
      else
        @run_path = Rails.root.join(run_path)
      end
    end

    def dump_structure_after_load=(dump_structure_after_load)
      @dump_structure_after_load = dump_structure_after_load
    end
  end

  class << self
    attr_accessor :configuration
  end

  @configuration ||= Configuration.new

  def self.configure
    yield(@configuration)
  end
end
