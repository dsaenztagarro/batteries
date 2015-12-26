Feature: Update brand

  Background:
    Given I am a new, authenticated user
    And I create a new brand with properties:
      | Name | AA |
    And I edit the brand identified by "AA"

    Scenario: Update brand with valid attributes
      Given I fill in "brand name" with "AAA"
      When I press "Update Brand"
      Then I should see "Show Brand"
      And I should see "Success! The Brand was updated"

    Scenario: Update brand with invalid attributes
      Given I fill in "brand name" with ""
      When I press "Update Brand"
      Then I should see "Edit Brand"
      And I should see "1 error prohibited this brand from being saved"
