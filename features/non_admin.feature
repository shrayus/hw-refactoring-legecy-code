Feature: Write Articles
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to merge articles

  Background:
    Given the blog is set up
    
     Given the following users exist:
    | login  | name  | password |
    | user   | User1 | abcde    |
    
    Given the following articles exist:
    | id | title    | author |
    | 1  | Article1 | user_1 |
    | 2  | Article2 | user_2 |

  Scenario: Successfully write articles
    Given I am on the categories page
    Given I am logged in as "user" with password "abcde"
    Then I should not see "merge_with"
