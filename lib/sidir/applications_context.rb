require 'shellwords'
require 'fileutils'

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
    
    def rm args
      app = args.first
      
      if directories.include? app
        puts "All data associated with \"#{app}\" will be permanently deleted.\nAre you sure?[yn]"
        answer = gets.strip
        if answer == 'y'
          FileUtils.rm_rf applications[app]
          puts "#{app} deleted"
        end
      else
        puts "\"#{app}\" not found"
      end
      self
    end
    
    def reset args
      app = args.first

      if directories.include? app
        FileUtils.cd applications[app] do
          puts "#{Dir.pwd}"

          %w(tmp Documents Library/Caches Library/Preferences).each do |dir|
            FileUtils.cd dir do
              Dir.glob('**').each do |path|
                unless path =~ /com\.apple\..*/
                  puts "cd #{dir}"
                  FileUtils.rm_r(path, verbose: true) 
                  puts 'cd -'
                end
              end
            end
          end
          
        end
      else
        puts "\"#{app}\" not found"
      end
      self
    end
    
    def prompt
      parent_context.prompt + "#{simulator}"
    end
    
    def commands
      super + %w(rm reset)
    end
    
    def help args
      puts <<-help
      cd    <item> - open finder at <item>
      cd    ..     - move back to simulators
      ls           - list available applications
      show         - open Finder here
      rm    <item> - delete the application <item> and all associated data 
      reset <item> - clean all paths in <item> as if the app is freshly installed
      help
      self
    end
    
    private
    
    def simulator
      File.basename(File.dirname(Dir.pwd))
    end
  end
end