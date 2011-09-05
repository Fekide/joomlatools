require 'thor'

module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "status", "displays information about Joomla! extension in current directory"
    method_options :location => "."

    def status

      handle_errors do
        manifest = Manifest.find(options[:location])
        say("Extension #{manifest.prefixed_name_with_version}")
      end
    end

  end

end