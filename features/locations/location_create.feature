@location
Feature: Create location

  Background:
    Given I am a new, authenticated user
    And I am on the locations page
    And I click "New Location"
    And I should be on the new location page

    Scenario: Create location with valid attributes
      Given I fill in "Name" with "Drawer under coffee maker"
      When I press "Create Location"
      Then I should see "Show Location"
      And I should see "Success! The Location was create"

    Scenario: Create location with invalid attributes
      Given I fill in "Name" with ""
      When I press "Create Location"
      Then I should see "New Location"
      And I should see "1 error prohibited this location from being saved"
