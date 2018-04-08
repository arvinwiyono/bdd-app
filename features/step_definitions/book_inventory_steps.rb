Given(/^I have populated my inventory with several books$/) do
  FactoryBot.create(:book, user: @registered_user, name: 'Don Quixote', author: 'Arvin Wiyono')
  FactoryBot.create(:book, user: @registered_user, name: 'Kill the Mocking Bird', author: 'Biondi')
end

Then(/^I should see the list of my books$/) do
  expect(page).to have_content('Don Quixote')
  expect(page).to have_content('Kill the Mocking Bird')
end

When("I submit a new book to my inventory") do
  click_link 'New Book'
  fill_in 'book_name', with: 'Harry Potter'
  fill_in 'book_author', with: 'J.K. Rowling'
  click_button 'Create Book'
end

Then("I should see the new book in my inventory") do
  visit root_path
  expect(page).to have_content('Harry Potter')
  expect(page).to have_content('J.K. Rowling')
end
