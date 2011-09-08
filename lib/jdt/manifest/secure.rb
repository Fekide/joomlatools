require "thor"

module Jdt

  class Manifest

    def secure
      "do nothing"
      # TODO check if every file with the ending .php contains the line::::: defined('_JEXEC') or die('Restricted access');
      # TODO if not, insert this directly after the line containing <?php within the file, including the comment: //No direct access to this file and print which files have been changed.   
    end

  end

end