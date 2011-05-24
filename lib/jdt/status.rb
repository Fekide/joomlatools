require 'thor'
require 'nokogiri'

class NoManifestException < RuntimeError

end

class BadManifestException < RuntimeError
  
end

class ManifestHandler

    attr_accessor :manifest, :path, :document, :has_found

    def initialize(search_path)
      @path = search_path
    end

    def load
      check_file_existence
      retrieve_type_and_name
    end

   def check_file_existence

    # create list of possible files for the manifest
    manifest_named_after_directory = File.basename(File.expand_path("."))
    manifest_files = ["manifest.xml",manifest_named_after_directory]

    # evaluate each possible manifest file
    manifest_files.each do |file|

      if(File.exists?(file))

        @has_found = true
        @manifest = file

        return
      end

    end

    # if no manifest is found, raise error
    raise NoManifestException,"Manifest not found in current directory"

   end

    def retrieve_type_and_name
      f = File.open(@manifest)
      doc = Nokogiri::XML(f)

      @name = doc.xpath("//extension[@name]")
      @type = doc.xpath("//extension[@type]")
      
      f.close
    end

end

class JDT < Thor
  include Thor::Actions

  desc "status","shows name and type of joomla element"
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
    if(element?)
      name = "name"

      if(component?)
        type = "component"
      elsif(module?)
        type = "module"
      end

      say("You are currently editing the #{type} #{name}")
    else
      say("No Joomla element found along path hierarchy.")
    end

  end

end