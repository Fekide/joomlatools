module Jdt

  class GeneratorCLI < Thor

    desc "component NAME", "generate component with NAME"

    def component(name)
      ComponentGenerator.new.generate(name)
    end


  end

end