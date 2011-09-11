require "launchy"

module Jdt

  class Xampp < Thor
    namespace :xampp

    desc "path", "show path to xampp"
    def path
      puts "Path is #{XamppConfig.new.xampp_path}"
    end

  end

end