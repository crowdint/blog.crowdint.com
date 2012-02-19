@javascript
Feature: Manage Posts

  Background:
    Given I am signed in as "test@test.com"
    And current user is publisher

  Scenario: Posts CRUD
    Given I go to the posts page
    And I click on "New Post"
    And I fill "A Great Post Title" as the post title
    And I fill "Body" as the post body
    And I press "Save"
    Then I should see "A Great Post Title"
    And I should see "test@test.com"
    And the post "A Great Post Title" should be authored by current user
    And the post "A Great Post Title" should have "a-great-post-title" as its permalink
    When I click "Edit" for "A Great Post Title"
    And I fill "Another Great Post Title" as the post title
    And I press "Save"
    Then I should see "Another Great Post Title"
    When I click "Delete" for "Another Great Post Title"
    Then I should not see "Another Great Post Title"

  Scenario: Publish unpublish post
    Given An author with name "Johan Crupps" and email "johan@crupps.com"
    And the following posts by "Johan Crupps":
      | title               | body                            | published |
      | The great gatsby    | Lorem Ipsum Cohiben Allen       | false     |
    And I go to the posts page
    When I click on "Publish"
    Then the post titled "The great gatsby" is marked as published
    And current user is set as its publisher
    When I click on "Publish"
    Then the post titled "The great gatsby" is marked as drafted

