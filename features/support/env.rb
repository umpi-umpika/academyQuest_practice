require 'cucumber/rails'
require 'factory_bot'

World(FactoryBot::Syntax::Methods)
ActionController::Base.allow_rescue = false

Capybara.register_driver :selenium_chrome_safe do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--disable-web-security')
  options.add_argument('--ignore-certificate-errors')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--screen-size=1200x720')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :selenium_chrome_headless_safe do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--headless=new')
  options.add_argument('--disable-web-security')
  options.add_argument('--ignore-certificate-errors')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--screen-size=1200x720')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome_headless_safe
  config.javascript_driver = :selenium_chrome_headless_safe
  config.default_max_wait_time = 10
end

if ENV['DEBUG'] == 'true'
  Capybara.default_driver = :selenium_chrome_safe
  Capybara.javascript_driver = :selenium_chrome_safe
  Selenium::WebDriver.logger.level = :error
  puts ":mag: Debug mode enabled - using visible Chrome (logging only errors)"
end
