# Messenger double for standard out
class Messenger
  def messenger
    @messenger ||= StringIO.new
  end

  def messages
    @messenger.string.split("\n")
  end
end

def stdout
  @stdout ||= Messenger.new
end

# User starts a game

Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  game = Codebreaker::Game.new(stdout.messenger)
  game.start
end

Then /^I should see "([^"]*)"$/ do |message|
  expect(stdout.messages).to include(message)
end

# User submit guess

Given(/^the secret code is "([^"]*)"$/) do |arg1|
  pending
end

When(/^I guess "([^"]*)"$/) do |arg1|
  pending
end

Then(/^the mark should be "([^"]*)"$/) do |arg1|
  pending
end

