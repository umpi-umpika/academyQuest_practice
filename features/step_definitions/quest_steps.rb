Given("Site contain all the quests") do
  Rails.application.load_seed()
  # Quest.create!(name: "Test Quest", status: false)
end

Given("I am on the quests page") do
  visit "/quests"
end

Then("I should see the Brags button under header") do
  expect(page).to have_content("Brags")
end

When("I click button {string}") do |link_text|
  click_link link_text
end

When("I click button call {string}") do |button_name|
  find("[data-testid='Add Quest Button']").click
end

Then("I should see the Brage page's details on the brage page") do
  visit "/brag"
end

Given("I am on the brage page") do
  visit "/brag"
end

Then("I should see the Home button on the top of page") do
    expect(page).to have_content("Home")
end

Then("I should see all quests on the quest page") do
  visit "/quests"
end

Given('I should see the {string} button') do |string|
  expect(page).to have_button(string)
end


And('Type {string} into the fill') do |text|
  find('input[data-testid="Add Quest"]').fill_in(with: text)
end

Then("I should see {string} under the text input") do |text|
  expect(page).to have_content(text)
end

Given("I should see a list of available quests") do
  expect(page).to have_css('li')
end

When("I click delete icon") do
  find("[data-testid='delete_icon']").click
end

Then("I click {string} to confirm deleting") do |button|
  page.accept_alert
end

Then("I should see TEST") do
  expect(page).to have_content('TEST')
end

Then("TEST disappear") do
  expect(page).not_to have_content('TEST')
end
