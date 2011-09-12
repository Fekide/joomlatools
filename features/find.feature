Feature: find the manifest file

  Scenario Outline: Not within an extension
    Given the current directory is no extension directory
    When I run `jdt.bat <command>`
    Then the output should contain exactly "No manifest found\n"

  Examples:
    | command   |
    | build    |
    | bump     |
    | clean    |
    | deploy  "http://test.de" |
    | manifest |
    | secure   |
    | status   |
    | undeploy |
    | validate |