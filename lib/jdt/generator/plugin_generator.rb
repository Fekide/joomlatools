module Jdt

  class PluginGenerator < Generator

    def generate(name)
      super

      # create files
      template("templates/plugin/manifest.xml.erb", "#{folder}/#{prefixed_name}.xml")
      template("templates/plugin/main.php.erb", "#{folder}/#{prefixed_name}.php")
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