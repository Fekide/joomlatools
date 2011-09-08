require "fileutils"

module Jdt

  class Config

    def initialize(file)

      # ensure that folder exists
      if (not File.exists?(directory))
        FileUtils.makedirs(directory)
      end

      @file = file

      # ensure that file exist
      if (not File.exists?(yaml_file))
        File.open(yaml_file, "w") do |f|
          f << "\#YAML file for storing configuration information"
        end
      end
    end

    def directory
      "#{ENV['HOME']}/.jdt"
    end

    def yaml_file
      "#{directory}/#{@file}"
    end

    def yaml_props
      props = YAML.load_file(yaml_file)
      if (props)
        props
      else
        Hash.new
      end
    end

    def update
      # read
      props = yaml_props

      # change
      yield props

      # write
      File.open(yaml_file, "w") do |f|
        f << props.to_yaml
      end
    end

  end

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
      File.join(xampp_path,"htdocs")
    end

  end
end