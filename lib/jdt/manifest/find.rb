module Jdt

  class Manifest

    def self.find(path = ".")
      Manifest.new(ManifestFinder.new(path).find)
    end

  end

  class NoManifestException < RuntimeError

  end

  class ManifestFinder

    attr_accessor :path

    def initialize(search_path = ".")
      @path = search_path
    end

    def find
      retrieve_manifest_path
    end

    private

    def retrieve_manifest_path

      # create list of possible files for the manifest
      manifest_named_after_directory = File.basename(File.expand_path(path))
      manifest_files = ["#{File.expand_path(path)}/manifest.xml", manifest_named_after_directory]

      # evaluate each possible manifest file
      manifest_files.each do |file|

        if (File.exists?(file))
          return file
        end

      end

      # if no manifest is found, raise error
      raise NoManifestException, "Manifest not found in current directory"
    end

  end

end