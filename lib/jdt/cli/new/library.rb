module Jdt

  class GeneratorCLI < Thor

    desc "library NAME", "generate library with NAME"

    def library(name)
      LibraryGenerator.new.generate(name)
    end

  end

end