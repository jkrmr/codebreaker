Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  game = Codebreaker::Game.new(output.messenger)
  game.start
end

Then /^I should see "([^"]*)"$/ do |message|
  expect(output.messages).to include(message)
end
