require 'readline'

module Sidir
  class Browser
    attr_accessor :current_context
    
    def initialize
      Dir.chdir File.expand_path("~/Library/Application Support/iPhone Simulator/")
      @current_context = SimulatorsContext.new nil
    end
    
    def self.start
      instance = self.new.repl
    end
        
    def repl
      cmd = nil
      
      Readline.completion_proc = proc do |input|
        current_context.completions input
      end
      
      while cmd != 'exit'
        line = Readline.readline("sidir #{current_context.prompt} > ", true)
        
        break if line.nil? || line =~ /^exit$/
        
        args = line.split
        cmd  = args.shift
                
        if current_context.available_command? cmd
          self.current_context = current_context.execute_command cmd, args
        else
          puts "command not recognised :#{cmd}"
          current_context.help nil
        end
      end
    end
  end
end
