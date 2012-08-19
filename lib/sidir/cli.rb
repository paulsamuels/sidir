require 'optparse'

module Sidir
  class CLI
    class << self
      def parse_options
        option_parser = OptionParser.new do |opts| 
          executable_name = File.basename($PROGRAM_NAME) 
          opts.banner = "Work with iOS simulator directories: #{executable_name}" 
        end
        
        option_parser.parse!
        
        Browser.start
      end
    end
  end
end

