module Jdt

  class ComponentGenerator < Generator

    def generate(name)
      super

      #empty_directory("#{folder}")
      template('templates/component/manifest.xml.erb', "#{folder}/manifest.xml")
      template('templates/component/script.php.erb', "#{folder}/script.php")

      # site
      site_dir = "#{folder}/site"
      empty_directory("#{site_dir}")
      template('templates/component/site/com_name.php.erb', "#{site_dir}/#{prefixed_name}.php")
      template('templates/component/site/controller.php.erb', "#{site_dir}/controller.php")

      #site view
      empty_directory("#{site_dir}/views/")

      #site models
      empty_directory("#{site_dir}/models/")

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
      template('templates/component/admin/com_name.php.erb', "#{admin_dir}/#{prefixed_name}.php")
      template('templates/component/admin/controller.php.erb', "#{admin_dir}/controller.php")

      #admin views
      empty_directory("#{admin_dir}/views/")

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

    no_tasks {
      def type
        "component"
      end

      def type_short
        "com"
      end


    }
  end

end