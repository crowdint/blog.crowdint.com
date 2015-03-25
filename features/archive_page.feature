Feature: Archive Page

  Background:
    Given An author with name "Johan Crupps" and email "johan@crupps.com"
    And the following posts by "Johan Crupps":
      | title               | body                            | published |
      | The great gatsby    | Lorem Ipsum Cohiben Allen       | true      |
      | Johnny was a sailor | Then the water must run deep    | true      |
      | Pipilium            | I heard Ramona sing             | true      |
      | The Kats            | Usually have long nails         | true      |
      | The Allman Brothers | They were in concert last night | true      |

  Scenario: Visiting the archive page
    Given I am in "root_path"
    When I click on "Blog Archive"
    Then I should see:
      | Blog Archive        |
      | Blog Home           |
      | 2015                |
      | The great gatsby    |
      | Johnny was a sailor |
      | Pipilium            |
      | The Kats            |
      | The Allman Brothers |

  Scenario: Using the archive search form
    Given I am in "archive_path"
    When I do a search
    Then I should see:
      |Your search results |
      |Johnny was a sailor |
      |Johan Crupps        |
