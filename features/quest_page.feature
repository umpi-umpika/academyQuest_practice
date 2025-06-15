Feature: Quest Page
  As a user
  I want to view and interact with quests

  Background:
    Given I am on the quests page
    And Site contain all the quests

  Scenario: Viewing Brags button that can link to the Brags Page
    Given I am on the quests page
    When I click button "Brags"
    Then I should see the Brage page's details on the brage page

  Scenario: Viewing Brags document
    Given I am on the brage page
    And I should see the Home button on the top of page
    When I click button "Home"
    Then I should see all quests on the quest page

  Scenario: Adding Quest
    Given I am on the quests page
    And I should see the "+ Add Quest" button
    And Type "TEST" into the fill
    When I click button call "+ Add Quest"
    Then I should see TEST


  Scenario: Deleting quests
    Given I am on the quests page
    And I should see a list of available quests
    When I click delete icon
    And I click "OK" to confirm deleting
    Then TEST disappear








