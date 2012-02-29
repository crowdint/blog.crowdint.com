Feature: Posts by Author Page

  Background:
    Given An author with name "Johan Crupps" and email "johan@crupps.com"

  Scenario: Rendering author's posts
    Given the following posts by "Johan Crupps":
      | title               | body                            | published |
      | The great gatsby    | Lorem Ipsum Cohiben Allen       | true      |
      | Johnny was a sailor | Then the water must run deep    | false     |
      | Pipilium            | I heard Ramona sing             | true      |
    When I go to the "johan" posts page
        Then I should see:
          | The great gatsby                |
          | Pipilium                        |
