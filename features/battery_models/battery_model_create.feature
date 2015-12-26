Feature: Create battery model

  Background:
    Given I am a new, authenticated user
    And I create a new battery size with properties:
      | Name | AA |
    And I am on the battery models page
    And I click "New Battery model"
    And I should be on the new battery model page

    Scenario: Create battery model with valid attributes
      Given I fill the battery model form with properties:
        | Name         | AA        |
        | Battery size | AA        |
        | Capacity     | 2400      |
      And I select "AA" from "Battery size"
      When I press "Create Battery model"
      Then I should see "Show Battery model"
      And I should see "Success! The Battery model was create"

    Scenario: Create battery model with invalid attributes
      When I press "Create Battery model"
      Then I should see "New Battery model"
      And I should see "3 errors prohibited this battery model from being saved"
