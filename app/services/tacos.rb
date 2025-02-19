class Tacos
  require 'selenium-webdriver'
  def initialize; end

  def self.run
    new.hit_page
  end

  def hit_page
    # Set up the Selenium WebDriver

    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless') # Run Chrome in headless mode (no UI)

    driver = Selenium::WebDriver.for :chrome, options: options
    begin
      # Visit Stack Overflow login page
      driver.navigate.to 'https://stackoverflow.com/users/login'

      # Enter your credentials
      driver.find_element(:id, 'email').send_keys Rails.application.credentials.stackoverflow_email.to_s
      driver.find_element(:id, 'password').send_keys Rails.application.credentials.stackoverflow_pass.to_s
      driver.find_element(:id, 'submit-button').click
      sleep(3) # Add delay for login to complete
      driver.navigate.to 'https://stackoverflow.com/users/19621594/itsvic'

      puts 'Visited Stack Overflow profile successfully!'
    ensure
      # Close the browser after visit
      driver.quit
    end
  end
end
