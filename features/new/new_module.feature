Feature: new module

  Generation data specific for generation a module.

  @wip
  Scenario: Create new module with name test
    When I successfully run `jdt.bat new module test`
    Then the following directories should exist:
    # template folder
      | mod_test/tmpl |
    And the following files should exist:
    # main entry file
      | mod_test/mod_test.php     |
      # contains the module logic
      | mod_test/helper.php       |
      # default template
      | mod_test/tmpl/default.php |