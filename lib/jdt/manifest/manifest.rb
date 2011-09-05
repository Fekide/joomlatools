require "nokogiri"

module Jdt

  class Manifest

    attr_accessor :file, :doc

    def initialize(path)
      @file = path
      @doc = Nokogiri::XML(File.read(file))
    end

    def to_xml
      xsl = Nokogiri::XSLT(File.read("#{File.dirname(File.expand_path(__FILE__))}/xslts/pretty_print.xsl"))
      xsl.transform(@doc).to_s
    end

    def folder
      File.dirname(file)
    end

    def exists?
      File.exists?(file)
    end

  end

end