Feature: Create device category

  Background:
    Given I am a new, authenticated user
    And I am on the device categories page
    And I click "New Device category"
    And I should be on the new device category page

    Scenario: Create device category with valid attributes
      Given I fill in "Name" with "AA"
      When I press "Create Device category"
      Then I should see "Show Device category"
      And I should see "Success! The Device category was create"

    Scenario: Create device category with invalid attributes
      Given I fill in "Name" with ""
      When I press "Create Device category"
      Then I should see "New Device category"
      And I should see "1 error prohibited this device category from being saved"
