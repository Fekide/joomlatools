require 'thor'
require 'thor/group'
require 'nokogiri'

module Jdt

  class GeneratorCLI < Thor

    desc "component NAME", "generate component with NAME"

    def component(name)
      ComponentGenerator.new.generate(name)
    end

    desc "module NAME", "generate module with NAME"

    def module(name)
      ModuleGenerator.new.generate(name)
    end

    desc "plugin NAME", "generate plugin with NAME"

    def plugin(name)
      PluginGenerator.new.generate(name)
    end

    desc "language NAME", "generate language with NAME"

    def language(name)
      LanguageGenerator.new.generate(name)
    end

    desc "template NAME", "generate template with NAME"

    def template(name)
      TemplateGenerator.new.generate(name)
    end

    desc "library NAME", "generate library with NAME"

    def library(name)
      LibraryGenerator.new.generate(name)
    end

  end

  class CLI < Thor
    register Jdt::GeneratorCLI, :new, "new <command>", "Commands for new extensions"
  end



end