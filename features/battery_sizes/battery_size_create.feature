Feature: Create battery size

  Scenario: Create battery size with valid attributes
    Given I am a new, authenticated user
    When I click "Admin"
    And I click "Battery size"
    Then I should see "Battery size list"

