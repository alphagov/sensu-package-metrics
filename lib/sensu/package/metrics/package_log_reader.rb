module Sensu
  module Package
    module Metrics
      class PackageLogReader

        def initialize(logfile)
          @logfile = logfile
        end

        def find(package)
          line = find_line(package)
          if line.nil?
            LineNotFound.new(package)
          else
            LineFound.new(package, line)
          end
        end

        def find_line(package)
          pattern = "status installed #{package}"
          File.readlines(@logfile).select {|line| line.include?(pattern) }.last
        end


        class LineNotFound
          def initialize(package)
            @package = package
          end

          def to_h
            {
              package: @package,
              status: 'not_found'
            }
          end
        end

        class LineFound
          def initialize(package, line)
            @package = package
            @line = line
          end

          def to_h
            analyse
          end

          def analyse
            @line.scan(/(.+) status installed #{@package} (\d+)/) do |timestamp, version| 
              unix_timestamp = DateTime.strptime(timestamp, "%Y-%m-%d %H:%M:%S").to_time.to_i
              return {
                package: @package,
                status: 'installed',
                version: version.to_i,
                installed_at: unix_timestamp
              }
            end
            return {
                package: @package,
                status: 'unknown'
            }
          end
        end
      end
    end
  end
end
