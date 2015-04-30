Given(/^the secret code is "([^"]*)"$/) do |secret|
  @game = Codebreaker::Game.new(stdout)
  @game.start(secret)
end

When(/^I guess "([^"]*)"$/) do |guess|
  @game.guess(guess)
end

Then(/^the mark should be "([^"]*)"$/) do |message|
  expect(stdout.messages).to include(message)
end
