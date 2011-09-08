@wip
Feature: find the manifest file

  Scenario Outline: Not within an extension
    Given the current directory is no extension directory
    When I run `jdt.bat <status>`
    Then the output should contain exactly "No manifest found\n"

  Examples:
    | status   |
    | status   |
    | clean    |
    | build    |
    | release  |
    | manifest |
    | validate |
    | secure   |
    | bump     |
    | install  |