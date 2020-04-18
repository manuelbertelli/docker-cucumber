$VERBOSE = nil

require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'helper.rb'
require_relative 'page_helper.rb'

BROWSER = ENV['BROWSER'] || :selenium_remote_chrome
CONFIG = YAML.load_file(
  "#{File.dirname(__FILE__)}/environment/#{ENV['ENV'] || 'local'}.yml"
)

World(Helper)
World(Pages)

Capybara.run_server = false

Capybara.register_driver 'selenium_remote_chrome' do |app|
  Capybara::Selenium::Driver.new(app,
                                 browser: :remote,
                                 desired_capabilities: :chrome,
                                 url: 'http://selenium-remote-chrome:4444/wd/hub')
end

Capybara.register_driver 'selenium_remote_firefox' do |app|
  Capybara::Selenium::Driver.new(app,
                                 browser: :remote,
                                 desired_capabilities: :firefox,
                                 url: 'http://selenium-remote-firefox:4444/wd/hub')
end

Capybara.configure do |config|
  config.default_driver = BROWSER
  config.app_host = CONFIG['default_url']
  config.default_max_wait_time = 10
end
