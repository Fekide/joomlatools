require "jdt/config"

module Jdt

  class XamppConfig

    def initialize
      @yaml = Config.new("xampp.yml")
    end

    def xampp_path=(path)
      @yaml.update do |props|
        props["path"] = path
      end
    end

    def xampp_path
      @yaml.yaml_props["path"]
    end

    def htdocs_path
      File.join(xampp_path, "htdocs")
    end

  end

end