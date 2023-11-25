Feature: Displaying representatives in search view


  Background:
    Given there is a representative in the database
      | name        | title      | address                           | photo                               | party       |
      | John Doe    | Senator    | { "street": "123 Main St", "city": "Anytown", "state": "CA", "zip": "12345" } | { "url": "http://example.com/john_doe.jpg", "width": 200, "height": 300 } | democrat    |

      
  Scenario: Viewing the list of representatives
    Given there are representatives in the database
    When I visit the representatives search page
    Then I should see a table of representatives
    And each representative should have a link to their profile
    And each representative should have a link to their news articles
