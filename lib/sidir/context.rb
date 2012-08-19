module Sidir
  class Context
    attr_accessor :parent_context
    
    def initialize parent_context
      self.parent_context = parent_context
    end
    
    def execute_command cmd, args
      send cmd.to_sym, args
    end
    
    def traverse_up
      self
    end
  
    def ls args
      puts directories
      self
    end
    
    def cd args
      paths = (args.shift || '').split('/')
      
      context = self
      
      paths.each do |path|
        if path == '..'
          context = traverse_up
        else
          context = traverse_down path
        end
      end
      
      context
    end
      
    def prompt
      '/'
    end
    
    def open_path
      Dir.pwd
    end
    
    def available_command? cmd
      commands.include? cmd
    end

    def completions input
      if input.strip == "" || input.nil?
        directories
      else
        directories.grep %r<^#{input}>
      end
    end
    
    def show args
      `open #{Shellwords.escape open_path}`
      self
    end
    
    private
    
    def commands
      %w(ls cd help show)
    end
  end
end