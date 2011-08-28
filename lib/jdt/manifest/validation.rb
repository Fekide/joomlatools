require "nokogiri"

module Jdt

  class ManifestValidator

    attr_accessor :manifest, :errors, :warnings

    def initialize
      errors = []
      warnings = []
    end

    # Validates the manifest
    #
    # @return bool true if valid, false otherwise
    def validate

      # ERROR when specified files and folders do not exist

      # ERROR when optional metadata field is missing (version, author, ...)
      # WARNING when metadata is missing

      # evaluate the validation result
      if (errors.empty?)
        true
      else
        false
      end
    end

    def validate_file_existence(file)
      if (not File.exist?(file))
        errors << "File #{file} does not exist, but should"
      end
    end

    def validate_directory_existence(dir)
      if (not Dir.exist?(file))
        errors << "File #{file} does not exist, but should"
      end
    end

    def validate_hook
      # do nothing, needs to implemented by subclass
    end

  end

end