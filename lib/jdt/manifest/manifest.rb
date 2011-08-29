require "nokogiri"

module Jdt

  class Manifest

    attr_accessor :file

    def initialize(path)
      @file = path
      @doc = Nokogiri::XML(File.open(file))
    end

    def folder
      File.dirname(file)
    end

    def exists?
      File.exists?(file)
    end

  end

end