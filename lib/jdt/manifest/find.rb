require "pathname"

module Jdt

  class Manifest

    def self.find(path = ".")
      Manifest.new(ManifestFinder.new(path).find).to_specific
    end

    def to_specific
      if (ext_type == "library")
        LibraryManifest.new(file)
      else
        raise RuntimeError("the current type #{ext_type} is not supported")
      end
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

      manifest_files = []

      Pathname.new(File.expand_path(path)).ascend do |current_path|

        # create list of possible files for the manifest
        current_folder = current_path
        current_folder_name = File.basename(current_folder)

        manifest_named_after_directory = "#{current_folder}/#{current_folder_name}.xml"
        manifest_with_fixed_name = "#{current_folder}/manifest.xml"
        manifest_files << manifest_with_fixed_name
        manifest_files << manifest_named_after_directory

        if (current_folder_name.include? "_")
          folder_name_without_prefix = current_folder_name.split("_")[1..-1].join("_")

          manifest_files << "#{current_folder}/#{folder_name_without_prefix}.xml"
        end

      end

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