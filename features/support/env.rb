require 'cucumber/rails'
require 'factory_bot'

World(FactoryBot::Syntax::Methods)
ActionController::Base.allow_rescue = false

chrome_args = [
  '--disable-web-security',
  '--ignore-certificate-errors',
  '--no-sandbox',
  '--disable-dev-shm-usage',
  '--window-size=1920,1080'
]

if RUBY_PLATFORM.include?('darwin') && ENV['DEBUG'] != 'true'
  chrome_args += [
    '--disable-gpu',
    '--disable-software-rasterizer',
    '--disable-background-timer-throttling',
    '--disable-backgrounding-occluded-windows',
    '--disable-renderer-backgrounding',
    '--disable-features=TranslateUI',
    '--disable-ipc-flooding-protection',
    '--force-color-profile=srgb'
  ]
end

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  chrome_args.each { |arg| options.add_argument(arg) }
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless=new')
  chrome_args.each { |arg| options.add_argument(arg) }
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

driver = ENV['DEBUG'] == 'true' ? :selenium_chrome : :selenium_chrome_headless

Selenium::WebDriver.logger.level = :error if ENV['DEBUG'] == 'true'

Capybara.configure do |config|
  config.default_driver = driver
  config.javascript_driver = driver
  config.default_max_wait_time = 10
end

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end
