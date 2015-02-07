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

