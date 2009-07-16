Given /^I have 0 activities$/ do
  Activity.destroy_all
end

Given /^I ([^ ]*) the ([^ ]*) page$/ do |method, page|
  visit page
end

Then /^I should have (\d*) activities$/ do |number|
  Activity.count.should == number.to_i
end
