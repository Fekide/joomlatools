require "thor"
require "jdt/version"

module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "version", "prints the current version of the JDT"
    def version()
      say "#{Jdt::VERSION}"
    end

  end

end

