Feature: Search freelancers on the Upwork site

  Scenario: Search freelancers by keyword
    Given The user is on the Upwork site
    When The user searches "dev" on the search field
    Then The results should be displayed
    And The results should contain the keyword

  Scenario: Validate keyword on a freelancer profile
    Given The user is on the Upwork site
    And The user searches "QA" on the search field
    And The results should be displayed
    When The user enters to a random profile
    Then The profile attributes should match the displayed on the results for the selected freelancer
    And The keyword should be contained in at least one attribute
