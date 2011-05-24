require 'thor'

class Xampp < Thor
  include Thor::Actions

  desc "configure","configure server settings"
  def configure

    # TODO change to extension root directory
    config_file = ".jdt/config.xml"

    if(!File.exists?(config_file))
      # create config file
      create_file(config_file,"configuration file")
    end

    # get xampp path
    # TODO what is returned when nothing is entered
    xampp_path = ask("Enter fully qualified xampp path (default: C:\\xampp):")

    # set xampp path default value if it has not been set
    if(xampp_path == "")
      xampp_path = "c:\\xampp"
    end
    
    # store information
    file = File.open(config_file,"rw")
    Nokogiri::XML(file)
    
    file.close



      "xampp_path: #{xampp_path}"

  end


  desc "start_server","start apache and mysql server"
  def start_server
    system("cd #{Config::PATH}")
    system("#{Config::PATH}/apache_start.bat")
    system("#{Config::PATH}/mysql_start.bat")
  end

  desc "stop_server", "stops apache and mysql server"
  def stop_server
    system("#{Config::PATH}/apache_stop.bat")
    system("#{Config::PATH}/mysql_stop.bat")
  end

  desc "restart","restart apache and mysql server"
  def restart
    stop_server
    start_server
  end

  desc "php_ini","show php.ini"
  def php_ini
    File.open("#{Config::PATH}/php/php.ini").each_line do |line|
      puts line
    end
  end

  desc "path","show path to xampp"
  def path
    puts "Path is #{Config::PATH}"
  end

=begin
  desc "phpmyadmin","open phpmyadmin in browser"
  def phpmyadmin
    system("#{Config::BROWSER} http://localhost/phpMyAdmin")
  end

  desc "web","open web in browser"
  def web
    system("#{Config::BROWSER} http://localhost/")
  end
=end

end