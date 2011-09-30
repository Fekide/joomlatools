module Jdt


  class LibraryGenerator < Generator

    def generate(name)
      super

      template('templates/library/manifest.xml.erb', "#{folder}/manifest.xml")

      empty_directory("#{folder}/lib")
      template("entry.php","#{folder}/#{prefixed_name}.php")
    end

    no_tasks {
      def type
        "library"
      end

      def type_short
        "lib"
      end
    }
  end

end