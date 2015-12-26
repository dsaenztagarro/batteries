Feature: Update battery model

  Background:
    Given I am a new, authenticated user
    And I create a new battery size with properties:
      | Name | AA |
    And I create a new battery model with properties:
      | Name         | Duracell  |
      | Battery size | AA        |
      | Capacity     | 2400      |
    And I edit the battery model identified by "Duracell"

    Scenario: Update battery model with valid attributes
      Given I fill in "Name" with "Energizer"
      When I press "Update Battery model"
      Then I should see "Show Battery model"
      And I should see "Success! The Battery model was updated"

    Scenario: Update battery model with invalid attributes
      Given I fill in "Name" with ""
      When I press "Update Battery model"
      Then I should see "Edit Battery model"
      And I should see "1 error prohibited this battery model from being saved"
