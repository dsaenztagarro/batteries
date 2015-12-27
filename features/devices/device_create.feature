Feature: Create device

  Background:
    Given I am a new, authenticated user
    And I create a new battery size with properties:
      | Name | AA |
    And I create a new device model with properties:
        | Name           | Toy car |
        | Battery size   | AA      |
        | Battery number | 2       |
    And I am on the devices page
    And I click "New Device"
    And I should be on the new device page

    Scenario: Create device with valid attributes
      Given I fill the device form with properties:
        | Name         | Maxi The Taxi |
        | Device model | Toy car       |
      When I press "Create Device"
      Then I should see "Show Device"
      And I should see "Success! The Device was create"

    Scenario: Create device with invalid attributes
      When I press "Create Device"
      Then I should see "New Device"
      And I should see "2 errors prohibited this device from being saved"
      And I should see "Name can't be blank"
      And I should see "Device model can't be blank"
