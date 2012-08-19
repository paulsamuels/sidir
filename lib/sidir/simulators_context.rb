module Sidir
  class SimulatorsContext < Context
    def directories
      Dir.entries('.').delete_if { |dir| dir =~ /^\.{1,2}/ }
    end  
    
    def traverse_down dir
      dir.strip!
      
      unless directories.include? dir
        puts "No such simulator :#{dir}"
      end
      
      Dir.chdir "#{dir}/Applications"
      ApplicationsContext.new self
    end
    
    def help args
      puts <<-help
      cd <item> - change to directory at <item>
      ls        - list available simulators
      show      - open Finder here
      help
      self
    end
  end
end