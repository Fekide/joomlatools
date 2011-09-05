require "thor"

module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "install", "installs the extension at an active Joomla! system"
    method_options :location => "."

    def install
      handle_errors do
        manifest = Manifest.find(options[:location])
      end

    end

  end

end