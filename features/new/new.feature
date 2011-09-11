Feature: new extension

  Scenario Outline: every new command should generate files and folders
    When I successfully run `jdt.bat new <type> test`
    Then the following directories should exist:
      | <short>_test |
    And the following files should exist:
      | <short>_test/manifest.xml |
      | <short>_test/README       |
      | <short>_test/CHANGELOG    |
      | <short>_test/LICENSE      |
      | <short>_test/script.php   |

  Examples:
    | type      | short |
    | component | com   |
    | module    | mod   |
    | plugin    | plg   |
    | template  | tpl   |
    | language  | lang  |
    | library   | lib   |

