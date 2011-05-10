class Component < Thor
  include Thor::Actions

  def self.source_root
    File.dirname(__FILE__)
  end

  desc "create COM_NAME", "create new component"
  def create(name)

    @name = name
    @type = "component"
    @version = "1.0"

    component_dir = "#{name}"


    empty_directory("#{component_dir}")
    template('templates/install.erb',"#{component_dir}/#{name}.xml")

    # site
    site_dir = "#{component_dir}/site"
    empty_directory("#{component_dir}")
    template('templates/entry.erb', "#{site_dir}/#{name}.php")
    template('templates/controller.erb', "#{site_dir}/controller.php")

    empty_directory("#{site_dir}/views/")
    empty_directory("#{site_dir}/models/")
    empty_directory("#{site_dir}/controllers/")
    empty_directory("#{site_dir}/language/")

    # admin
    admin_dir = "#{component_dir}/admin"

    empty_directory("#{admin_dir}")
    template('templates/entry.erb', "#{admin_dir}/#{name}.php")
    template('templates/controller.erb', "#{admin_dir}/controller.php")

    empty_directory("#{admin_dir}/views/")
    empty_directory("#{admin_dir}/models/")
    empty_directory("#{admin_dir}/models/forms/")
    empty_directory("#{admin_dir}/models/rules/")
    empty_directory("#{admin_dir}/models/fields/")
    empty_directory("#{admin_dir}/controllers/")
    empty_directory("#{admin_dir}/helpers/")
    empty_directory("#{admin_dir}/tables/")
    empty_directory("#{admin_dir}/language/")
    empty_directory("#{admin_dir}/sql/")
    empty_directory("#{admin_dir}/sql/updates/")
  end

  desc "model MODEL_NAME", "create new model in current component"
  def model(name)

    # TODO

  end

end