Feature: Version

  In order to detect, which version is installed
  As a CLI
  I want to obtain the current version

  Scenario: Display current version
    When I run `jdt.bat version`
    Then the output should contain exactly "0.0.2\n"