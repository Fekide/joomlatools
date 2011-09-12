Feature: new library

  Generation data specific for generation a library.

  Scenario: Create new library with name test
    When I successfully run `jdt.bat new library test`
    Then the following directories should exist:
    # folder for library logic
      | lib_test/lib |
    And the following files should exist:
    # main entry file
      | lib_test/test.php |