require 'find'

module Rails
  module SqlFunctions
    module ExecuteSql
      def run_sql_file(path)
        sql = File.read(path)
        ActiveRecord::Base.connection.execute sql
      end

      def run_in_dir(directory)
        Find.find(directory) do |path|
          if FileTest.directory?(path)
            unless path.to_s.starts_with?(directory.to_s)
              puts "#{path.to_s} #{directory.to_s}"
              run_in_dir(path)
            end
          else
            if path.downcase.ends_with?(".sql")
              run_sql_file(path)
            end
          end
        end
      end
    end
  end
end