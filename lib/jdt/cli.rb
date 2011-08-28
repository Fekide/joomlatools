require "thor"

require "commands/new"
require "commands/create_index"
require "commands/version"
require "commands/zip"


module Jdt

  class CLI < Thor
    
    # include templates directory
    def self.source_root
      File.dirname(__FILE__)
    end
    
  end

end