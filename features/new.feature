Feature: new

  @wip
  Scenario: Create library
    When I successfully run `jdt.bat new library test`
    Then the following directories should exist:
    | lib_test           |
    | lib_test/lib       |
    And the following files should exist:
    | lib_test/README    |
    | lib_test/CHANGELOG |
    | lib_test/test.php  |