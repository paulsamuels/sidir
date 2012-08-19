require 'shellwords'

module Sidir
  class ApplicationsContext < Context
    
    attr_reader :simulator
        
    def directories
      applications.keys.sort
    end

    def applications
      {}.tap do |applications|
        Dir.glob("*/*.app").entries.delete_if { |dir| dir =~ /^\.{1,2}$/ }.each do |path|
          applications[File.basename path, '.app'] = File.dirname path
        end
      end
    end
    
    def traverse_up
      Dir.chdir '../..'
      parent_context
    end
    
    def traverse_down dir
      dir.strip!
      
      unless applications.keys.include? dir
        puts "No such application :#{dir}"
      end
      
      `open #{Shellwords.escape(Dir.pwd + '/' + applications[dir])}`
      self
    end
    
    def prompt
      parent_context.prompt + "#{simulator}"
    end
    
    def help
      %Q{
        cd <item> - open finder at <item>
        cd ..     - move back to simulators
        ls        - list available applications
      }
    end
    
    private
    
    def simulator
      File.basename(File.dirname(Dir.pwd))
    end
  end
end