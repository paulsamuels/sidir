require 'readline'
require 'shellwords'

module Sidir
  class Browser
    
    attr_accessor :current_context
    
    def initialize
      Dir.chdir File.expand_path("~/Library/Application Support/iPhone Simulator/")
      self.current_context = SimulatorsContext.new nil
    end
    
    def self.start
      instance = self.new.repl
    end
        
    def repl
      command = nil
      
      Readline.completion_proc = proc do |input|
        current_context.completions input
      end
      
      while command != 'exit'
        command = Readline.readline "sidir #{current_context.prompt} > ", true
        break if command.nil?
        execute_command command
      end
    end
    
    def execute_command cmd
      case cmd
      when /^ls$/
        puts current_context.ls
      when /^cd (.*)/
        paths = $1.split('/')
        
        paths.each do |path|
          if path == '..'
            self.current_context = current_context.traverse_up
          else
            self.current_context = current_context.traverse_down path
          end
        end
        
      when /^show/
        `open #{Shellwords.escape current_context.open_path}`
      when /^help$/
        puts self.current_context.help
      end
    end
  end
end