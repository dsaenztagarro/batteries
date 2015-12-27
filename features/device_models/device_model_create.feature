Feature: Create device model

  Background:
    Given I am a new, authenticated user
    And I create a new battery size with properties:
      | Name | AA |
    And I am on the device models page
    And I click "New Device model"
    And I should be on the new device model page

    Scenario: Create device model with valid attributes
      Given I fill the device model form with properties:
        | Name           | Toy car |
        | Battery size   | AA      |
        | Battery number | 2       |
      When I press "Create Device model"
      Then I should see "Show Device model"
      And I should see "Success! The Device model was create"

    Scenario: Create device model with invalid attributes
      When I press "Create Device model"
      Then I should see "New Device model"
      And I should see "1 error prohibited this device model from being saved"
      And I should see "Name can't be blank"
