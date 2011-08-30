require 'thor'

module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "status", "displays information about Joomla! extension in current directory"
    method_options :location => "."
    def status

      begin
        manifest = Manifest.find(options[:location])
        say("Extension #{manifest.prefixed_name_with_version}")
        say("Author: #{manifest.author} [#{manifest.author_email}]")
      rescue NoManifestException
        say("No manifest found")
      end

    end

  end

end