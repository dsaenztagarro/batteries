Feature: Update battery size

  Background:
    Given I am a new, authenticated user
    And I create a new battery size with properties:
      | name | AA |
    And I edit the battery size identified by "AA"

    Scenario: Update battery size with valid attributes
      Given I fill in "battery size name" with "AAA"
      When I press "Update Battery size"
      Then I should see "Show Battery size"
      And I should see "Success! The Battery size was updated"

    Scenario: Update battery size with invalid attributes
      Given I fill in "battery size name" with ""
      When I press "Update Battery size"
      Then I should see "Edit Battery size"
      And I should see "1 error prohibited this battery size from being saved"
