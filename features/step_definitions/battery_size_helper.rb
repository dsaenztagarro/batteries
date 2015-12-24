Given(/^I create a (.+) with properties:$/) do |resource, table|
  # table is a Cucumber::Ast::Table
  resource_params = table.rows_hash
  steps %{
    And I am on the #{resource.pluralize} page
    And I click "New #{resource.capitalize}"
  }
  resource_params.each_pair do |key, value|
    step %{I fill in "#{resource} #{key}" with "#{value}"}
  end
  step %{I press "Create"}
end

