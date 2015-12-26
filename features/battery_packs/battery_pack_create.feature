Feature: Create battery pack

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
    And I am on the battery packs page
    And I click "New Battery pack"
    And I should be on the new battery pack page

    Scenario: Create battery pack with valid attributes
      Given I fill the battery pack form with properties:
        | Battery pack model | Duracell AA 2400mAh |
      When I press "Create Battery pack"
      Then I should see "Show Battery pack"
      And I should see "Success! The Battery pack was create"

    Scenario: Create battery pack with invalid attributes
      When I press "Create Battery pack"
      Then I should see "New Battery pack"
      And I should see "1 error prohibited this battery pack from being saved"
      And I should see "Battery pack model can't be blank"
