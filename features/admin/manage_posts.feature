Feature: Manage Posts

  @javascript
  Scenario: Posts CRUD
    Given I go to the posts page
    And I click on "New Post"
    And I fill "A Great Post Title" as the post title
    And I fill "Body" as the post body
    And I press "Save"
    Then I should see "A Great Post Title"
    When I click "Edit" for "A Great Post Title"
    And I fill "Another Great Post Title" as the post title
    And I press "Save"
    Then I should see "Another Great Post Title"
    When I click "Delete" for "Another Great Post Title"
    Then I should not see "Another Great Post Title"
