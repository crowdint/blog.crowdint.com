Feature: Read Post
  Background:
    Given An author with name "Johan Crupps" and email "johan@crupps.com"

  Scenario: Read a Post
    Given the published posts by "Johan Crupps":
      | title               | body                            |
      | The great gatsby    | Lorem Ipsum Cohiben Allen       |
    When I go to the index page
    And I click on "The great gatsby"
    Then I should see:
      | The great gatsby                |
      | Lorem Ipsum Cohiben Allen       |
