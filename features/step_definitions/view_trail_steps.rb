Given /^I add 2 \+ 2$/ do
  @sum = 4
end

Then /^I should have 4$/ do
  @sum.should == 4
end
