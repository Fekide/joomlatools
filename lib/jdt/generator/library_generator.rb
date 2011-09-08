module Jdt


  class LibraryGenerator < Generator

    # include templates directory
    def self.source_root
      "#{File.dirname(__FILE__)}/templates/library"
    end

    def generate(name)
      super

      empty_directory("#{prefixed_name}/lib")
      template("entry.php","#{prefixed_name}/#{prefixed_name}.php")
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