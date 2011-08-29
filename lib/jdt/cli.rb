require "thor"

require "commands/new"
require "commands/secure"
require "commands/version"
require "commands/build"
require "commands/bump"
require "commands/install"
require "commands/status"
require "commands/validate"

module Jdt

  class CLI < Thor
    
    # include templates directory
    def self.source_root
      File.dirname(__FILE__)
    end
    
  end

end