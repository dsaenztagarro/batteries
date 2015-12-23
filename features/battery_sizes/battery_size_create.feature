Feature: Create battery size

  Background:
    Given I am a new, authenticated user
    And I am on the battery sizes page
    And I click "New Battery size"
    And I should be on the new battery size page

    Scenario: Create battery size with valid attributes
      Given I fill in "battery size name" with "AA"
      When I press "Create Battery size"
      Then I should see "Show Battery size"
      And I should see "Success! The Battery size was create"

    Scenario: Create battery size with invalid attributes
      Given I fill in "battery size name" with ""
      When I press "Create Battery size"
      Then I should see "New Battery size"
      And I should see "1 error prohibited this battery_size from being saved"
