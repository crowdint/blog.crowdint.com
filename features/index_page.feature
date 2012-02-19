Feature: Index Page

  Background:
    Given An author with name "Johan Crupps" and email "johan@crupps.com"

  Scenario: Show last 3 published posts
    Given the published posts by "Johan Crupps":
      | title               | body                            |
      | The great gatsby    | Lorem Ipsum Cohiben Allen       |
      | Pipilium            | I heard Ramona sing             |
      | The Allman Brothers | They were in concert last night |
      | Johnny was a sailor | Then the water must run deep    |
    When I go to the index page
    Then I should see:
      | The great gatsby                |
      | Lorem Ipsum Cohiben Allen       |
      | Pipilium                        |
      | I heard Ramona sing             |
      | The Allman Brothers             |
      | They were in concert last night |

