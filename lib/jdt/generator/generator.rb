require 'thor'
require 'thor/actions'
require 'date'
require 'nokogiri'

module Jdt

  class Generator < Thor
    include Thor::Actions

    attr_accessor :name, :author, :description, :creation_date, :location

    desc "generate NAME", "generate using name"

    def generate(name)

      # set up variables with default values
      @name = name
      @version = "0.0.1"
      @author = "AUTHOR"
      @description = "DESCRIPTION"
      @creation_date = "#{Date::MONTHNAMES[Time.now.month]} #{Time.now.year}"
      @location = "."

      # create directory and files which every extension needs
      empty_directory(prefixed_name)
      template("README.erb", "#{prefixed_name}/README")
      #template("LICENSE.erb", "#{prefixed_name}/LICENSE")
      template("CHANGELOG.erb", "#{prefixed_name}/CHANGELOG")
      template("manifest.xml.erb", "#{prefixed_name}/manifest.xml")
    end


    no_tasks {
      def type
        throw NoMethodError
      end

      def type_short
        throw NoMethodError
      end

      def prefixed_name
        "#{type_short}_#{name}"
      end

      def folder
        "#{location}/#{prefixed_name}"
      end
    }
  end

end