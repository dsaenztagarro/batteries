Feature: Update battery pack model

  Background:
    Given I am a new, authenticated user
    And I create a new battery size with properties:
      | Name | AA |
    And I create a new battery model with properties:
      | Name         | Duracell  |
      | Battery size | AA        |
      | Capacity     | 2400      |
    And I create a new battery pack model with properties:
      | Battery model | Duracell AA 2400mAh |
      | Size          | 16                  |
    And I edit the battery pack model identified by "Duracell AA 2400mAh"

    Scenario: Update battery pack model with valid attributes
      Given I fill in "Size" with "8"
      When I press "Update Battery pack model"
      Then I should see "Show Battery pack model"
      And I should see "Success! The Battery pack model was updated"

    Scenario: Update battery pack model with invalid attributes
      Given I fill in "Size" with ""
      When I press "Update Battery pack model"
      Then I should see "Edit Battery pack model"
      And I should see "1 error prohibited this battery pack model from being saved"
      And I should see "Size is not a number"
