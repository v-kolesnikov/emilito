browser = ENV.fetch('EMILITO_TEST_SELENIUM_BROWSER', 'CHROME').downcase.to_sym
driver = :"selenium_#{browser}"

Capybara.register_driver driver do |app|
  Capybara::Selenium::Driver.new(app, browser: browser)
end

Capybara.default_driver = driver
