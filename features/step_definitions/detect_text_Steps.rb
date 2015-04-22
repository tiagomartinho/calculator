Then /^I (?:read) "([^\"]*)"$/ do |name|
  wait_for(WAIT_TIMEOUT) { query("label {text BEGINSWITH '#{name}'}").count + query("label {text CONTAINS '#{name}'}").count >= 1}
end

Then /^I don't (?:read) "([^\"]*)"$/ do |name|
  wait_for(WAIT_TIMEOUT) { query("label {text BEGINSWITH '#{name}'}").count + query("label {text CONTAINS '#{name}'}").count == 0}
end
