Feature: Create battery

  Background:
    Given I am a new, authenticated user
    And I create a new battery size with properties:
      | Name | AA |
    And I create a new battery model with properties:
      | Name         | Duracell  |
      | Battery size | AA        |
      | Capacity     | 2400      |
    And I am on the batteries page
    And I click "New Battery"
    And I should be on the new battery page

    Scenario: Create battery with valid attributes
      Given I fill the battery form with properties:
        | Battery model | Duracell AA 2400mAh |
      When I press "Create Battery"
      Then I should see "Show Battery"
      And I should see "Success! The Battery was create"

    Scenario: Create battery with invalid attributes
      When I press "Create Battery"
      Then I should see "New Battery"
      And I should see "1 error prohibited this battery from being saved"
      And I should see "Battery model can't be blank"
