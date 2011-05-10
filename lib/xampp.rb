module Config
  BROWSER = "chrome"
  PATH = "c:/xampp"
end

class Xampp < Thor

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

  desc "phpmyadmin","open phpmyadmin in browser"
  def phpmyadmin
    system("#{Config::BROWSER} http://localhost/phpMyAdmin")
  end

  desc "web","open web in browser"
  def web
    system("#{Config::BROWSER} http://localhost/")
  end

end