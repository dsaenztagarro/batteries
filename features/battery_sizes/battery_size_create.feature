Feature: Create battery size

  Background:
    Given I am a new, authenticated user
    And I am on the battery sizes page

    Scenario: Create battery size with valid attributes
      Then I should see "Battery size list"

