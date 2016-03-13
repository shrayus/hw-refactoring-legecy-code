Feature: Write Articles
  As a blog administrator
  In order condense similar articles and thoughts
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel

    Given the following users exist:
    | profile_id | login  | name  | password |
    | 1          | user_1 | User1 | 1234567  |
    | 2          | user_2 | User2 | 1234567  |

    Given the following articles exist:
    | id | title    | author | user_id | allow_comments | body  |
    | 1  | Foo      | user_1 | 1       | true           | Lorem |
    | 2  | Bar      | user_2 | 2       | true           | Ipsum |

    Given the following comments exist:
    | id | type    | author | body     | article_id | user_id |
    | 1  | Comment | user_1 | One      | 1          | 2       |
    | 2  | Comment | user_1 | Punch    | 2          | 2       |

  Scenario: Successfully merged Texts Bodies
    Given I am on the new article page
    And I am on the Edit Page of Article with id 1
    Then I should see "Merge"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Articles successfully merged!"
    When I follow "Foo"
    Then I should see "Lorem"
    And I should see "Ipsum"
    
  Scenario: One AUTHHOOORRRRRR
    Given the articles "1" and "2" were merged
    And I am on the Home Page
    Then I should see "Foo"
    When I follow "Foo"
    Then the Author of "1" should be "user_1"
    And the Author of "1" should not be "user_2"
    
  Scenario: How many comments? ONE BUNNCCCHHHHHH!!!
    Given the articles "1" and "2" were merged
    And I am on the Home Page
    Then I should see "Foo"
    When I follow "Foo"
    Then I should see "One"
    And I should see "Punch"
    
  Scenario: One TITLEEEEE
    Given the articles "1" and "2" were merged
    And I am on the Home Page
    Then I should see "Foo"
    And I should not see "Bar"