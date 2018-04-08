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

Given("I have a book in my inventory") do
  FactoryBot.create(:book, user: @registered_user, name: 'Original title')
end

When("I change the title of my book") do
  visit root_path
  click_link 'Edit'
  fill_in 'book_name', with: 'New title'
  click_button 'Update Book'
end

Then("I should see the book with the new title in my inventory") do
  visit root_path
  expect(page).to have_content 'New title'
end

When("I delete the book") do
  visit root_path
  click_link 'Destroy'
end

Then("I should not see it listed in my inventory") do
  visit root_path
  expect(page).not_to have_content 'Original title'
end
