Given(/^I have populated my inventory with several books$/) do
  FactoryBot.create(:book, user: @registered_user, name: 'Don Quixote', author: 'Arvin Wiyono')
  FactoryBot.create(:book, user: @registered_user, name: 'Kill the Mocking Bird', author: 'Biondi')
end

Then(/^I should see the list of my books$/) do
  expect(page).to have_content('Don Quixote')
  expect(page).to have_content('Kill the Mocking Bird')
end

Given("I am a registered user") do
end
