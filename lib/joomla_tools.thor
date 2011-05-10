require 'thor'
require 'nokogiri'

class JoomlaTools < Thor
  include Thor::Actions

  desc "status","shows name and type of joomla element"
  def status

    # search xml file of current element
    

    if(element?)
      name = "name"

      if(component?)
        type = "component"
      elsif(module?)
        type = "module"
      end

      say("You are currently editing the #{type} #{name}")
    else
      say("No Joomla element found along path hierarchy.")
    end


  end

  desc "new TYPE NAME","creates a stub of TYPE with NAME"
  def new(type, name)

    if(!Joomla::TYPES.include?(type))
      # error
      say("Given type is no Joomla extension type. Chose one of the available Joomla extension types:")
      say("Extension types: #{Joomla::TYPES.join(" ")}")
    else

      @name = name
      @type = type
      @version = "1.0"
      @author = "AUTHOR"
      @description = "DESCRIPTION"

      if(type == "module")
        dir_name = "mod_#{name}"

        # create directories
        empty_directory(dir_name)
        empty_directory("#{dir_name}/tmpl")

        # create files
        template("templates/module/mod_xml.erb","#{dir_name}/mod_#{name}.xml")
        template("templates/module/mod_name.erb","#{dir_name}/mod_#{name}.php")
        template("templates/module/helper.erb","#{dir_name}/helper.php")
        template("templates/module/tmpl/default.erb","#{dir_name}/tmpl/default.php")
      end

    end

  end



  # include templates directory
  def self.source_root
    File.dirname(__FILE__)
  end

end

module Joomla
  TYPES = ["component","module","plugin","template","library"]
end