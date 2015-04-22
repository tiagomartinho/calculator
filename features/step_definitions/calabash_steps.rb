Then /^I (?:click) the "([^\"]*)" button$/ do |name|
  touch("button marked: '#{name}'")
end

Then(/^I click "(.*?)"$/) do |name|
  touch("button marked: '#{name}'")
end

Then(/^I have "(.*?)"$/) do |expected_mark|
  until element_exists("view marked:'#{expected_mark}'") ||
        element_exists("view text:'#{expected_mark}'")
    screenshot_and_raise "No element found with mark or text: #{expected_mark}"
  end
end
