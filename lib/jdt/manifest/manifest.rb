require "nokogiri"

module Jdt

  class Manifest

    attr_accessor :file, :doc

    def initialize(path)
      @file = path
      @doc = Nokogiri::XML(File.read(file))
    end

    def to_xml
      @doc.to_xml(:indent => 4, :encoding => 'UTF-8')
    end

    def folder
      File.dirname(file)
    end

    def exists?
      File.exists?(file)
    end

  end

end