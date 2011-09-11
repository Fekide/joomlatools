module Jdt

  class Xampp < Thor

    desc "php_ini", "show php.ini"

    def php_ini
      File.open("#{XamppConfig.new.xampp_path}/php/php.ini").each_line do |line|
        puts line
      end
    end

  end

end