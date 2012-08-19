module Sidir
  class Context
    attr_accessor :parent_context
    
    def initialize parent_context
      self.parent_context = parent_context
    end
    
    def traverse_up
      self
    end
  
    def ls
      directories
    end
    
    def directories
      []
    end
  
    def prompt
      '/'
    end
    
    def open_path
      Dir.pwd
    end

    def completions input
      if input.strip == "" || input.nil?
        ls
      else
        ls.grep /^#{input}/
      end
    end
  end
end