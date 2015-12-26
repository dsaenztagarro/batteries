Feature: Create battery pack model

  Background:
    Given I am a new, authenticated user
    And I create a new battery size with properties:
      | Name | AA |
    And I create a new battery model with properties:
      | Name         | Duracell  |
      | Battery size | AA        |
      | Capacity     | 2400      |
    And I am on the battery pack models page
    And I click "New Battery pack model"
    And I should be on the new battery pack model page

    Scenario: Create battery pack model with valid attributes
      Given I fill the battery pack model form with properties:
        | Battery model | Duracell AA 2400mAh |
        | Size | 16 |
      When I press "Create Battery pack model"
      Then I should see "Show Battery pack model"
      And I should see "Success! The Battery pack model was create"

    Scenario: Create battery pack model with invalid attributes
      When I press "Create Battery pack model"
      Then I should see "New Battery pack model"
      And I should see "2 errors prohibited this battery pack model from being saved"
      And I should see "Battery model can't be blank"
      And I should see "Size is not a number"
