require "nokogiri"


module Jdt


  class Manifest

    attr_accessor :file

    attr_accessor :required_joomla_version, :extension_method

    attr_accessor :author, :author_email, :author_url, :creation_date

    attr_accessor :name, :description, :version

    attr_accessor :copyright, :license

    def initialize(path)
      @file = path
      @doc = Nokogiri::XML(File.open(file))

      from_xml
    end

    def from_xml
      @required_joomla_version = @doc.xpath("//extension").first['version']
      @extension_method = @doc.xpath("//extension").first['method']

      @author = @doc.xpath("//extension/author").text
      @author_email = @doc.xpath("//extension/authoremail").text
      @author_url = @doc.xpath("//extension/authorurl").text
      @creation_date = @doc.xpath("//extension/creationdate").text

      @name = @doc.xpath("//extension/name").text
      @description = @doc.xpath("//extension/description").text
      @version = @doc.xpath("//extension/version").text

      @copyright = @doc.xpath("//extension/copyright").text
      @license = @doc.xpath("//extension/license").text
    end

    def folder
      File.dirname(file)
    end


    def bump!

    end

  end

end