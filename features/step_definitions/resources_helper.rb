require_relative 'selectable_fields'

Given (/^I fill the (.+) form with properties:$/) do |resource, table|
  table.rows_hash.each_pair do |key, value|
    if SELECTABLE_FIELDS.include? key
      step %{I select "#{value}" from "#{key}"}
    else
      step %{I fill in "#{key}" with "#{value}"}
    end
  end
end

Given(/^I create a new (.+) with properties:$/) do |resource, resource_table|
  steps %{
    And I am on the #{resource.pluralize} page
    And I click "New #{resource.capitalize}"
  }
  step "I fill the #{resource} form with properties:", resource_table
  step %{I press "Create"}
end

Given(/^I edit the (.+) identified by "(.+)"$/) do |resource, value|
  # table is a Cucumber::Ast::Table
  steps %{
    And I am on the #{resource.pluralize} page
    And I click "#{value}"
    And I click "Edit"
  }
end
