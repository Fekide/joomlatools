require "thor"

require "jdt/commands/build"
require "jdt/commands/bump"
require "jdt/commands/install"
require "jdt/commands/new"
require "jdt/commands/pretty_print"
#require "jdt/commands/secure"
require "jdt/commands/status"
require "jdt/commands/validate"
require "jdt/commands/version"

require "jdt/manifest"
require "jdt/generator"

module Jdt

  class CLI < Thor
    
  end

end