Feature: Categories Page

  @omniauth_test
  Scenario: Admin creating a category
    Given I am logged in as an admin user
      And I go to the admin categories page
     When I click on "New Category"
      And I fill "Spree" as the category name
      And I press "Create"
      Then I should see "Spree"

  @omniauth_test
  Scenario: Admin deleating an existing category
    Given I am logged in as an admin user
      And I have a category with the name "Spree"
     When I go to the admin categories page
     Then I should see "Spree"
     When I click on "delete"
     Then I should not see "delete"

  @omniauth_test
  Scenario: Adding post categories
    Given I have a category with the name "Spree"
      And An author with name "Johan Crupps" and email "foobar@crowdint.com"
      And the following posts by "Johan Crupps":
      | title               | body                            | published |
      | The great gatsby    | Lorem Ipsum Cohiben Allen       | true      |
     And I am logged in as an admin user
    When I go to the admin posts page
     And I click on "Published"
     And I click on "Edit"
     And I check "Spree" on the categories list
     And I press "Update"
     And I go to the posts page
    Then I should see "Spree" within "#share"

