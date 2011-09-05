require 'thor'
require 'nokogiri'

module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "new TYPE NAME", "creates a stub of TYPE with NAME"
    method_options :location => "."

    def new(type, name)

      handle_errors do

        begin
          generator = Generator.find(type.to_sym, name)
          generator.location = options[:location]
          generator.generate
        rescue Jdt::ExtensionTypeNotFoundError
          say("Given type is no Joomla extension type. Chose one of the available Joomla extension types:")
          say("Extension types: #{Generator::GENERATORS.join(" ")}")
        end

      end
      
    end

  end

end