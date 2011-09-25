module Jdt

  class ModuleGenerator < Generator

    def generate(name)
      super

      # create sub directories
      empty_directory("#{folder}/tmpl")

      # create files
      template("templates/module/manifest.xml.erb", "#{folder}/manifest.xml")
      template("templates/module/mod_name.php.erb", "#{folder}/#{prefixed_name}.php")
      template("templates/module/helper.php.erb", "#{folder}/helper.php")
      template("templates/module/tmpl/default.php.erb", "#{folder}/tmpl/default.php")
    end

    no_tasks {
      def type
        "module"
      end

      def type_short
        "mod"
      end
    }
  end

end