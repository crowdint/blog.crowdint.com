Feature: Index Page

  Background:
    Given An author with name "Johan Crupps" and email "johan@crupps.com"

  Scenario: Show last 3 published posts
    Given the following posts by "Johan Crupps":
      | title               | body                            | published |
      | The great gatsby    | Lorem Ipsum Cohiben Allen       | true      |
      | Johnny was a sailor | Then the water must run deep    | false     |
      | Pipilium            | I heard Ramona sing             | true      |
      | The Kats            | Usually have long nails         | false     |
      | The Allman Brothers | They were in concert last night | true      |
    When I go to the index page
    Then I should see:
      | The great gatsby                |
      | Lorem Ipsum Cohiben Allen       |
      | Pipilium                        |
      | I heard Ramona sing             |
      | The Allman Brothers             |
      | They were in concert last night |

  Scenario: Pagination for index page
    Given the following posts by "Johan Crupps":
      | title               | body                            | published |
      | The great gatsby    | Lorem Ipsum Cohiben Allen       | true      |
      | Johnny was a sailor | Then the water must run deep    | true      |
      | Pipilium            | I heard Ramona sing             | true      |
      | The Kats            | Usually have long nails         | true      |
      | The Allman Brothers | They were in concert last night | true      |
      | The zalatown        | Some time ago in the zalaton    | true      |
      | Rancho grande       | Alla en el rancho grande...     | true      |
     When I go to the index page
     Then I should see "The great gatsby" within "#share"
      And I should see:
      | The great gatsby    |
      | Johnny was a sailor |
      | Pipilium            |
      | The Kats            |
      | The Allman Brothers |
     When I click on "Next >"
     Then I should see:
      | The zalatown  |
      | Rancho grande |
