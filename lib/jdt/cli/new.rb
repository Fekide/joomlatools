require "jdt/cli/new/component"
require "jdt/cli/new/language"
require "jdt/cli/new/library"
require "jdt/cli/new/module"
require "jdt/cli/new/plugin"
require "jdt/cli/new/template"

module Jdt

  class GeneratorCLI < Thor
    def self.banner(task, namespace = true, subcommand = false)
      "#{basename} #{task.formatted_usage(self, true, subcommand)}"
    end
  end

  class CLI < Thor
    register Jdt::GeneratorCLI, :new, "new <command>", "cli for new extensions"
  end
end