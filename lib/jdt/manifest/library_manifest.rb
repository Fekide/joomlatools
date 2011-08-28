require "jdt/helper/manifest"

module Jdt

  class LibraryManifestValidator < ManifestValidator

    def validate_hook

      # validate files
      manifest.files.each do |file|
        validate_file_existence("#{folder}/#{file}")
      end


    end

  end


end