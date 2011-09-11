require "launchy"

module Jdt

  class Xampp < Thor
    namespace :xampp

    desc "configure", "configure server settings"

    def configure
      # get xampp path
      xampp_path = ask("Enter fully qualified xampp path (default: C:\\xampp):")

      # set xampp path default value if it has not been set
      if (xampp_path == "")
        xampp_path = "c:\\xampp"
      end

      # store it
      XamppConfig.new.xampp_path = xampp_path
    end



  end

end