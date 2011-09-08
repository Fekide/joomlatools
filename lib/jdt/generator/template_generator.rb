module Jdt

  class TemplateGenerator < Generator

    def generate(name)
      super

      #create empty directory
      empty_directory("#{folder}/css")
      empty_directory("#{folder}/html")
      empty_directory("#{folder}/images")
    end

    no_tasks {
      def type
        "template"
      end

      def type_short
        "tpl"
      end
    }
  end

end