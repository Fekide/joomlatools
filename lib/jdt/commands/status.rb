require 'thor'
require 'nokogiri'

module Jdt



  class CLI < Thor
    include Thor::Actions

    desc "status", "shows name and type of joomla element"

    def status

      # search for xml files in the current directory

      isManifestFound = false

      begin
        manifest = ManifestHandler.new(".").load
        say("#{manifest.type} #{manifest.name} found")
      rescue NoManifestException => e
        say("#{e}")
        return
      rescue BadManifestException => e
        say("#{e}")
        return
      end

      # search xml file of current element
      if (element?)
        name = "name"

        if (component?)
          type = "component"
        elsif (module?)
          type = "module"
        end

        say("You are currently editing the #{type} #{name}")
      else
        say("No Joomla element found along path hierarchy.")
      end

    end

  end

end