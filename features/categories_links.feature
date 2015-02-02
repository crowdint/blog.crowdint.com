Feature: Categories Links

  Background:
    Given Categories and posts

  @javascript
  Scenario: User in root page
    Given I am in the main page
     Then I should see:
      |Mario|
      |Zelda|
    #Given I click on "mario"
     When I select "mario"
     Then I should see:
       |All post for mario|
       |This is a post    |
       |Petronilo         |
