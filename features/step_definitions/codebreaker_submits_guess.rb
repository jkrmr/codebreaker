Given(/^the secret code is "([^"]*)"$/) do |secret|
  @game = Codebreaker::Game.new(output)
  @game.start(secret)
end

When(/^I guess "([^"]*)"$/) do |guess|
  @game.guess(guess)
end

Then(/^the mark should be "([^"]*)"$/) do |message|
  expect(output.messages).to include(message)
end

