puts "Clearing existing quests..."
Quest.destroy_all

puts "Creating quests..."

quests = if Rails.env.test?
  [
    { name: "Test Quest", status: false, created_at: Time.parse("2025-03-01") }
  ]
else
  [
    { name: "Class-NVC", status: true, created_at: Time.parse("2025-03-01") },
    { name: "Class-Scrum", status: true, created_at: Time.parse("2025-03-01") },
    { name: "Class-Ruby On Rails", status: true, created_at: Time.parse("2025-04-01") },
    { name: "Class-GIT", status: true, created_at: Time.parse("2025-04-01") },
    { name: "Class-Agile Testing", status: true, created_at: Time.parse("2025-04-01") },
    { name: "Class-Playwright Testing", status: true, created_at: Time.parse("2025-04-01") },
    { name: "Class-Container Fundamental", status: true, created_at: Time.parse("2025-04-01") },
    { name: "Class-Docker", status: true, created_at: Time.parse("2025-04-01") },
    { name: "Class-CI on Gitlabs", status: true, created_at: Time.parse("2025-04-01") },
    { name: "Class-Jenkins", status: true, created_at: Time.parse("2025-04-01") },
    { name: "Class-Figma", status: true, created_at: Time.parse("2025-04-01") },
    { name: "Class-UX, User story", status: true, created_at: Time.parse("2025-04-01") },
    { name: "Git test 25/25", status: false, created_at: Time.parse("2025-06-01") },
    { name: "Scrum test 100%", status: false, created_at: Time.parse("2025-06-01") },
    { name: "Monkey type 55 wpm, acc 95%", status: false, created_at: Time.parse("2025-06-01") },
    { name: "UI design for academy test", status: false, created_at: Time.parse("2025-06-01") },
    { name: "Extra test, Bussiness/QA/UX", status: false, created_at: Time.parse("2025-06-02") },
    { name: "Read User story mapping book", status: false, created_at: Time.parse("2025-06-02") },
    { name: "BMA Project", status: false, created_at: Time.parse("2025-06-06") }
  ]
end

quests.each do |quest_data|
  quest = Quest.create!(quest_data)
  puts "Created quest: #{quest.name} (Status: #{quest.status ? 'Completed' : 'Incomplete'})"
end

puts "Seed completed: Created #{Quest.count} quests"
