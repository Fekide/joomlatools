require "thor"

require "jdt/manifest/finder"
require "jdt/manifest/schema_validator"

module Jdt

  class CLI < Thor

    desc "validate", "validates the manifest file against schema and additional validations"
    method_options :location => "."
    def validate

      manifest = Manifest.find(options[:location])

      if (manifest.valid?)
        say "Manifest (#{manifest.file}) is valid"
      else
        say "Manifest (#{manifest.file}) is NOT valid"
        manifest.errors.each do |error|
          say "ERR: #{error}"
        end
      end

      if (not manifest.warnings.empty?)
        manifest.warnings.each do |warning|
          say "WARN: #{warning}"
        end
      end
    end


  end

end