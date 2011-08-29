require "thor"

module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "secure", "ensures the existence of index.html for every referenced folder"
    method_options :location => "."
    def secure ()
      manifest = Manifest.find(options[:location])
      manifest.secure
    end

  end

end