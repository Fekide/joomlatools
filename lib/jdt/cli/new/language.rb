module Jdt

  class GeneratorCLI < Thor

    desc "language NAME", "generate language with NAME"

    def language(name)
      LanguageGenerator.new.generate(name)
    end

  end

end