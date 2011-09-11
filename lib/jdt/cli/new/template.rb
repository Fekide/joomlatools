module Jdt

  class GeneratorCLI < Thor

    desc "template NAME", "generate template with NAME"

    def template(name)
      TemplateGenerator.new.generate(name)
    end

  end

end