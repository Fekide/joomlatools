require 'thor'
require 'date'
require 'nokogiri'

module Jdt

  class ExtensionTypeNotFoundError < RuntimeError;
  end

  class Generator < Thor
    include Thor::Actions

    # include templates directory
    def self.source_root
      File.dirname(__FILE__)
    end

    attr_accessor :name, :author, :description, :creation_date, :location

    def initialize(name)
      @name = name
      @version = "0.0.1"
      @author = "AUTHOR"
      @description = "DESCRIPTION"
      @creation_date = "#{Date::MONTHNAMES[Time.now.month]} #{Time.now.year}"
      @location = "."
    end

    no_tasks{
    def generate
      # create directory
      empty_directory(prefixed_name)

      # TODO create README, LICENSE, CHANGELOG
    end

    def type
      throw NoMethodError
    end

    def type_short
      throw NoMethodError
    end

    def self.find(type, name)

      if (type == :component)
        ComponentGenerator.new(name)
      elsif(type == :module)
        ModuleGenerator.new(name)
      elsif(type == :plugin)
        PluginGenerator.new(name)
      elsif(type == :library)
        LibraryGenerator.new(name)
      elsif(type == :template)
        TemplateGenerator.new(name)
      elsif(type == :language)
        LanguageGenerator.new(name)
      else
        raise ExtensionTypeNotFoundError
      end

    end

    def prefixed_name
      "#{type_short}_#{name}"
    end

    def folder
      "#{location}/#{prefixed_name}"
    end
    }
  end

  class LanguageGenerator < Generator
    no_tasks{
    def generate
      super

    end

    def type
      "language"
    end

    def type_short
      "lang"
    end
    }
  end

  class TemplateGenerator < Generator
    no_tasks{
    def generate
      super

      #create empty directory
      empty_directory("#{folder}/css")
      empty_directory("#{folder}/html")
      empty_directory("#{folder}/images")
    end

    def type
      "template"
    end

    def type_short
      "tpl"
    end
    }
  end

  class LibraryGenerator < Generator
    no_tasks{
    def generate
      super
    end

    def type
      "library"
    end

    def type_short
      "lib"
    end
    }
  end

  class PluginGenerator < Generator
    no_tasks{
    def generate
      super

      # create files
      template("templates/plugin/manifest.xml.erb", "#{folder}/#{prefixed_name}.xml")
      template("templates/plugin/main.php.erb", "#{folder}/#{prefixed_name}.php")
    end

    def type
      "plugin"
    end

    def type_short
      "plg"
    end
    }
  end

  class ModuleGenerator < Generator
    no_tasks{
    def generate
      super

      # create sub directories
      empty_directory("#{folder}/tmpl")

      # create files
      template("templates/module/manifest.xml.erb", "#{folder}/#{prefixed_name}.xml")
      template("templates/module/mod_name.php.erb", "#{folder}/#{prefixed_name}.php")
      template("templates/module/helper.php.erb", "#{folder}/helper.php")
      template("templates/module/tmpl/default.php.erb", "#{folder}/tmpl/default.php")
    end

    def type
      "module"
    end

    def type_short
      "mod"
    end
    }
  end

  class ComponentGenerator < Generator
    no_tasks{
    def generate
      super

      view_name = "#{name}"

      empty_directory("#{folder}")
      template('templates/component/manifest.xml.erb', "#{folder}/manifest.xml")
      template('templates/component/script.php.erb', "#{folder}/script.php")

      # site
      site_dir = "#{folder}/site"
      empty_directory("#{site_dir}")
      template('templates/component/site/com_name.php.erb', "#{site_dir}/#{prefixed_name}.php")
      template('templates/component/site/controller.php.erb', "#{site_dir}/controller.php")

      #site view
      empty_directory("#{site_dir}/views/")
      empty_directory("#{site_dir}/views/#{view_name}")
      template('templates/component/site/views/view_name/view.html.erb', "#{site_dir}/views/#{view_name}/view.html.php")
      empty_directory("#{site_dir}/views/#{view_name}/tmpl")
      template('templates/component/site/views/view_name/tmpl/default.php.erb', "#{site_dir}/views/#{view_name}/tmpl/default.php")
      template('templates/component/site/views/view_name/tmpl/default.xml.erb', "#{site_dir}/views/#{view_name}/tmpl/default.xml")

      #site models
      empty_directory("#{site_dir}/models/")
      template('templates/component/site/models/com_model_name.erb', "#{site_dir}/models/com_#{name}.php")

      #site controllers
      empty_directory("#{site_dir}/controllers/")

      #site language
      empty_directory("#{site_dir}/language/")
      empty_directory("#{site_dir}/language/en-GB/")
      empty_directory("#{site_dir}/language/de-DE/")

      # admin
      admin_dir = "#{folder}/admin"
      empty_directory("#{admin_dir}")
      template('templates/component/admin/access.xml.erb', "#{admin_dir}/access.xml")
      template('templates/component/admin/config.xml.erb', "#{admin_dir}/config.xml")
      template('templates/component/admin/com_name.php.erb', "#{admin_dir}/com_#{name}.php")
      template('templates/component/admin/controller.php.erb', "#{admin_dir}/controller.php")

      #admin views
      empty_directory("#{admin_dir}/views/")
      empty_directory("#{admin_dir}/views/#{view_name}")
      template('templates/component/admin/views/view_name/view.html.erb', "#{admin_dir}/views/#{view_name}/view.html.php")
      empty_directory("#{admin_dir}/views/#{view_name}/tmpl")
      template('templates/component/admin/views/view_name/tmpl/default.php.erb', "#{admin_dir}/views/#{view_name}/tmpl/default.php")

      #admin models
      empty_directory("#{admin_dir}/models/")
      empty_directory("#{admin_dir}/models/forms/")
      empty_directory("#{admin_dir}/models/rules/")
      empty_directory("#{admin_dir}/models/fields/")

      #admin controllers
      empty_directory("#{admin_dir}/controllers/")

      #admin helpers
      empty_directory("#{admin_dir}/helpers/")

      #admin tables
      empty_directory("#{admin_dir}/tables/")

      #admin language
      empty_directory("#{admin_dir}/language/")
      empty_directory("#{admin_dir}/language/en-GB/")
      empty_directory("#{admin_dir}/language/de-DE/")

      #admin sql
      empty_directory("#{admin_dir}/sql/")
      empty_directory("#{admin_dir}/sql/updates/")

    end

    def type
      "component"
    end

    def type_short
      "com"
    end
    }
  end

end