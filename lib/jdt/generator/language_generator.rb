module Jdt

  class LanguageGenerator < Generator

    def generate(name)
      super

      template('templates/language/manifest.xml.erb', "#{folder}/manifest.xml")

    end

    no_tasks {
      def type
        "language"
      end

      def type_short
        "lang"
      end
    }
  end

end