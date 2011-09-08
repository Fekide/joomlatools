module Jdt

  class LanguageGenerator < Generator

    def generate(name)
      super

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