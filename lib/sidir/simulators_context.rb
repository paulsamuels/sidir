module Sidir
  class SimulatorsContext < Context
    def directories
      Dir.entries('.').delete_if { |dir| dir =~ /^\.{1,2}/ }
    end  
    
    def traverse_down dir
      dir.strip!
      
      unless ls.include? dir
        puts "No such simulator :#{dir}"
      end
      
      Dir.chdir "#{dir}/Applications"
      ApplicationsContext.new self
    end
    
    def help
      %Q{
        cd <item> - change to directory at <item>
        ls        - list available simulators
      }
    end
  end
end