module Jdt

  class PluginGenerator < Generator

    def generate(name)
      super

      # create files
      template("templates/plugin/manifest.xml.erb", "#{folder}/manifest.xml")
      template("templates/plugin/main.php.erb", "#{folder}/main.php")
    end

    no_tasks {
      def type
        "plugin"
      end

      def type_short
        "plg"
      end
    }
  end

end