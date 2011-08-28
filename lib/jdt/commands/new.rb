require 'thor'
require 'nokogiri'

module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "new TYPE NAME", "creates a stub of TYPE with NAME"

    def new(type, name)

      if (!Joomla::Extension::TYPES.include?(type))
        # error
        say("Given type is no Joomla extension type. Chose one of the available Joomla extension types:")
        say("Extension types: #{Joomla::Extension::TYPES.join(" ")}")
      else

        @name = name
        @type = type
        @version = "1.0"
        @author = "AUTHOR"
        @description = "DESCRIPTION"
        @creation_date = "#{Date::MONTHNAMES[Time.now.month]} #{Time.now.year}"

        if (type == "module")
          dir_name = "mod_#{name}"

          # create directories
          empty_directory(dir_name)
          empty_directory("#{dir_name}/tmpl")

          # create files
          template("templates/module/mod_xml.erb", "#{dir_name}/mod_#{name}.xml")
          template("templates/module/mod_name.erb", "#{dir_name}/mod_#{name}.php")
          template("templates/module/helper.erb", "#{dir_name}/helper.php")
          template("templates/module/tmpl/default.erb", "#{dir_name}/tmpl/default.php")

        elsif (type == "plugin")

          dir_name = "plg_#{name}"

          # create directories
          empty_directory(dir_name)

          # create files
          template("templates/plugin/plg_xml.erb", "#{dir_name}/plg_#{name}.xml")
          template("templates/plugin/plg_php.erb", "#{dir_name}/plg_#{name}.php")

        elsif (type == "component")
          dir_name = "com_#{name}"
          view_name = "#{name}"

          empty_directory("#{dir_name}")
          template('templates/component/com_xml.erb', "#{dir_name}/manifest.xml")
          template('templates/component/script.erb', "#{dir_name}/script.php")

          # site
          site_dir = "#{dir_name}/site"
          empty_directory("#{site_dir}")
          template('templates/component/site/com_name.erb', "#{site_dir}/com_#{name}.php")
          template('templates/component/site/controller.erb', "#{site_dir}/controller.php")

          #site view
          empty_directory("#{site_dir}/views/")
          empty_directory("#{site_dir}/views/#{view_name}")
          template('templates/component/site/views/view_name/view.html.erb', "#{site_dir}/views/#{view_name}/view.html.php")
          empty_directory("#{site_dir}/views/#{view_name}/tmpl")
          template('templates/component/site/views/view_name/tmpl/default_php.erb', "#{site_dir}/views/#{view_name}/tmpl/default.php")
          template('templates/component/site/views/view_name/tmpl/default_xml.erb', "#{site_dir}/views/#{view_name}/tmpl/default.xml")

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
          admin_dir = "#{dir_name}/admin"
          empty_directory("#{admin_dir}")
          template('templates/component/admin/access.erb', "#{admin_dir}/access.xml")
          template('templates/component/admin/config.erb', "#{admin_dir}/config.xml")
          template('templates/component/admin/com_name.erb', "#{admin_dir}/com_#{name}.php")
          template('templates/component/admin/controller.erb', "#{admin_dir}/controller.php")

          #admin views
          empty_directory("#{admin_dir}/views/")
          empty_directory("#{admin_dir}/views/#{view_name}")
          template('templates/component/admin/views/view_name/view.html.erb', "#{admin_dir}/views/#{view_name}/view.html.php")
          empty_directory("#{admin_dir}/views/#{view_name}/tmpl")
          template('templates/component/admin/views/view_name/tmpl/default.erb', "#{admin_dir}/views/#{view_name}/tmpl/default.php")

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

        elsif (type == "library")
          dir_name = "lib_#{name}"

        elsif (type == "template")
          dir_name = "tem_#{name}"

          #create empty directory
          empty_directory("#{dir_name}/css")
          empty_directory("#{dir_name}/html")
          empty_directory("#{dir_name}/images")
        end

      end

    end

  end
end