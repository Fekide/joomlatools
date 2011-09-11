module Jdt

  class GeneratorCLI < Thor

    desc "plugin NAME", "generate plugin with NAME"

    def plugin(name)
      PluginGenerator.new.generate(name)
    end

  end

end