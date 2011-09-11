module Jdt


  class Manifest

    def clean
      Dir.delete zip_folder
      Dir.delete config_folder
    end

  end



end