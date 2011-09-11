require "mechanize"

module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "undeploy", "undeploys the extension from a remote Joomla! reachable via URL"
    method_options :location => "."

    def undeploy
      handle_errors do
        manifest = Manifest.find(options[:location])
        zip_file = manifest.build

      end

    end

  end

end