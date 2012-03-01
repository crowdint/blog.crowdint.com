Feature: Users
  As a User (CrowdInt)
  I should be able to access the Frontend

  @wip
  @javascript
  Scenario: See Sign in page
    When I go to the admin page
    Then I should see the Sign in page

  @wip
  @javascript
  Scenario: User Sign Out
    Given I am signed in as "test@crowdint.com"
    When I Sign Out
    Then I should be Signed Out
