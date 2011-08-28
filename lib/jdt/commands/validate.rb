require "thor"

require "jdt/manifest/finder"
require "jdt/manifest/schema_validator"

module Jdt

  class CLI < Thor


    desc "validate","validates the manifest file against schema and additional validations"
    # method options to allow manuell specification of manifest file to support manuall path
    def validate



    end


  end

end