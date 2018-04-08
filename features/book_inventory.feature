Feature: Book Inventory

  In order to be able to keep track of my books
  As a user
  I should be able to keep an inventory of my books

  Background:
    Given I am a registered User
    And I am logged in

  Scenario:
    Given I have populated my inventory with several books
    When I visit the homepage
    Then I should see the list of my books

  Scenario: Adding a new book
    When I submit a new book to my inventory
    Then I should see the new book in my inventory
