Feature: Create food

  Background:
    Given I am a new, authenticated user
    And I create a new brand with properties:
      | Name | Hacendado |
    And I create a new food model with properties:
      | Name  | Peach Jam |
      | Brand | Hacendado |
    And I am on the foods page
    And I click "New Food"
    And I should be on the new food page

    Scenario: Create food with valid attributes
      Given I fill the food form with properties:
        | Food model | Peach Jam Hacendado |
      When I press "Create Food"
      Then I should see "Show Food"
      And I should see "Success! The Food was create"

    Scenario: Create food with invalid attributes
      Given I select "" from "Food model"
      When I press "Create Food"
      Then I should see "New Food"
      And I should see "1 error prohibited this food from being saved"
      And I should see "Food model can't be blank"
