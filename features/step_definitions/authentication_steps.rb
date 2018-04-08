def fill_log_in_form
  fill_in 'user_email', with: 'tester@testdomain.test'
  fill_in 'user_password', with: 'p@s$word'
end

Given("I visit the homepage") do
  visit root_path
end

When("I fill in the sign up form") do
  click_link 'Sign up'

  fill_in 'user_email', with: 'tester@testdomain.test'
  fill_in 'user_password', with: 'p@s$word'
  fill_in 'user_password_confirmation', with: 'p@s$word'

  click_button 'Sign up'
end

When("I confirm the email") do
  open_email('tester@testdomain.test')
  visit_in_email('Confirm my account')
end

Then("should see that my account is confirmed") do
  message = 'Your email address has been successfully confirmed'
  expect(page).to have_content(message)
end

Given("I am a registered User") do
  @registered_user = FactoryBot.create(:user)
end

When("I fill in the login form") do
  fill_log_in_form
  click_button 'Log in'
end

Then("I should be logged in") do
  expect(page).to have_content('Signed in')
end

Given("I am logged in") do
  visit root_path
  fill_log_in_form
  click_button 'Log in'
end

When("I click on the log out button") do
  click_link 'Log out'
end

Then("I should be redirected to the log in page") do
  expect(page).to have_content('Log in')
end
