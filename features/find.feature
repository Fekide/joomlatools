@wip
Feature: find the manifest file

  Scenario Outline: Not within an extension
    Given the current directory is no extension directory
    When I run `jdt.bat <status>`
    Then the output should contain exactly "No manifest found\n"

  Examples:
    | status   |
    | build    |
    | bump     |
    | clean    |
    | deploy  "http://test.de" |
    | manifest |
    | secure   |
    | status   |
    | undeploy |
    | validate |