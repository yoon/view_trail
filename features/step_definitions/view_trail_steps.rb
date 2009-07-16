Given /^I current user is (\d*)$/ do |id|
  ApplicationController.cu = id
end

Given /^I have 0 activities$/ do
  Activity.destroy_all
end

Given /^I ([^ ]*) the ([^ ]*) page$/ do |method, page|
  visit page, method.to_sym
end

Then /^I should have (\d*) activities$/ do |number|
  Activity.count.should == number.to_i
end

Then /^the last activity should have "([^\"]*)" ([^ ]*)$/ do |value, key|
  Activity.last.send(key.to_sym).to_s.should == value
end

