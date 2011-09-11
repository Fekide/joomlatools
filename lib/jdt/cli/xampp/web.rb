require "launchy"

module Jdt

  class Xampp < Thor
    desc "web", "open localhost in browser"

    def web
      link = "http://localhost/"
      Launchy.open(link)
    end

  end

end