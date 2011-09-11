require "thor"
require "thor/group"

require "jdt/cli/build"
require "jdt/cli/bump"
require "jdt/cli/clean"
require "jdt/cli/deploy"
require "jdt/cli/generate"
require "jdt/cli/new"
require "jdt/cli/pretty_print"
require "jdt/cli/secure"
require "jdt/cli/status"
require "jdt/cli/undeploy"
require "jdt/cli/validate"
require "jdt/cli/version"
require "jdt/cli/xampp"

module Jdt

  class CLI < Thor

    no_tasks {
      def handle_errors(&block)
        begin
          yield
        rescue NoManifestException
          say "No manifest found"
        end
      end
    }

  end


end