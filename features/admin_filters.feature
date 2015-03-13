@omniauth_test
Feature: Filters for admin

  Background: Admin checking different filters
    Given I am logged in as an admin user
      And the following posts by "foo":
        | title                | body                             | state     | published |
        | Wecking Crew         | I can't believe it, is he mario? | drafted   | false     |
        | Xenoblade Chronicles | This is the monado's power!      | finished  | false     |
        | Bayonetta 2          | Do you want to touch me?         | reviewed  | false     |
        | Starfox              | Do a barrel doll!                | published | true      |
      And I go to the admin posts page

  Scenario: admin visiting /admin/posts
     When I click on "All"
     Then I should see:
        | Wecking Crew         |
        | Xenoblade Chronicles |
        | Bayonetta 2          |

  Scenario: admin visiting /admin/posts/drafted
     When I click on "Drafted"
     Then I should see:
        | Wecking Crew         |

  Scenario: admin visiting /admin/posts/finished
     When I click on "Finished"
     Then I should see:
       | Xenoblade Chronicles  |

  Scenario: admin visiting /admin/posts/reviewed
     When I click on "Reviewed"
     Then I should see:
       | Bayonetta 2           |

  Scenario: admin visiting /admin/posts/published
     When I click on "Published"
     Then I should see:
       | Starfox               |
