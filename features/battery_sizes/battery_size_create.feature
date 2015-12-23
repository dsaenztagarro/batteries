Feature: Create battery size

  Background:
    Given I am a new, authenticated user
    And I am on the battery sizes page

    Scenario: Create battery size with valid attributes
      Given I click "New Battery size"
      And I should be on the new battery size page
      When I fill in "battery size name" with "AA"
      And I press "Create Battery size"
      Then I should see "Show Battery size"
      And I should see "Success! The Battery size was create"

