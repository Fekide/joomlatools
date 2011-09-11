module Jdt

  class GeneratorCLI < Thor

    desc "module NAME", "generate module with NAME"

    def module(name)
      ModuleGenerator.new.generate(name)
    end

  end

end